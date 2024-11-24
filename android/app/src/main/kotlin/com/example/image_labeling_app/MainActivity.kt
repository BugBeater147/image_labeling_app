package com.example.image_labeling_app

import android.os.Environment
import android.util.Base64
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.image_saver"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "saveImage") {
                val base64Image = call.argument<String>("image")
                val success = saveImageToGallery(base64Image)
                if (success) {
                    result.success("Image saved successfully!")
                } else {
                    result.error("SAVE_FAILED", "Could not save image", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun saveImageToGallery(base64Image: String?): Boolean {
        return try {
            val bytes = Base64.decode(base64Image, Base64.DEFAULT)
            val path = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES).absolutePath
            val file = File(path, "saved_image_${System.currentTimeMillis()}.png")
            file.parentFile?.mkdirs()
            val fos = FileOutputStream(file)
            fos.write(bytes)
            fos.close()
            true
        } catch (e: Exception) {
            e.printStackTrace()
            false
        }
    }
}
