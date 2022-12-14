package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class FLTAd : MethodCallHandler {

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "delegate" -> {
                // Automatically handled on Android
                result.success(null)
            }
            "playbackDelegate" -> {
                // Automatically handled on Android
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

}
