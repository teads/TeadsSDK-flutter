package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FLTAdRatio */
class FLTAdRatio : MethodCallHandler {

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "calculateHeight" -> {
                (call.arguments as List<*>).let { args ->
                    val with = args[0] as? Float
                    val requestIdentifier = args[1] as? String
                    if (with != null && requestIdentifier != null)
                        result.success("ok")
                    //FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).adRatio.calculateHeight(for: width)
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            "value" -> {
                (call.arguments as List<*>).let { args ->
                    val with = args[0] as? Float
                    val requestIdentifier = args[1] as? String
                    if (with != null && requestIdentifier != null)
                        result.success("ok")
                    //FLTTeadsAdInstanceManager.shared.instance(for: requestIdentifier).adRatio.value(for: width)
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            else -> result.error("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        }
    }
}
