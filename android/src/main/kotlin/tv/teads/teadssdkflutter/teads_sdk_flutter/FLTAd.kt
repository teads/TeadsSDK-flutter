package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FLTAd */
class FLTAd : MethodCallHandler {

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "delegate" -> {
                (call.arguments as List<*>).let { args ->
                    val requestIdentifier = args[0] as? String
                    if (requestIdentifier != null) {
                        //FLTAdInstanceManager.shared.instance("1")
                        //FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).teadsAd.delegate = self
                        result.success(null)

                    } else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            "playbackDelegate" -> {
                (call.arguments as List<*>).let { args ->
                    val requestIdentifier = args[0] as? String
                    if (requestIdentifier != null) {
                        //FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).teadsAd.playbackDelegate = self
                        result.success(null)

                    } else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            else -> result.error("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        }
    }

}
