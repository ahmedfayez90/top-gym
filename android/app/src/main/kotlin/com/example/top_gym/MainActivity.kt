package com.example.top_gym

//import io.flutter.embedding.android.FlutterActivity
//
//class MainActivity: FlutterActivity() {
//}
//import io.flutter.embedding.android.FlutterFragmentActivity
//
//class MainActivity: FlutterFragmentActivity() {
//    // ...
//}
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}