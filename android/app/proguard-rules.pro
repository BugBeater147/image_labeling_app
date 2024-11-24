# Keep Firebase-related classes
-keep class com.google.firebase.** { *; }
-keep class com.google.mlkit.** { *; }

# Keep Flutter-related classes
-keep class io.flutter.** { *; }

# General Android ProGuard rules
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keepclassmembers class * {
    @androidx.annotation.Keep <fields>;
}
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn com.google.firebase.**
-dontwarn com.google.mlkit.**
-dontwarn io.flutter.**
