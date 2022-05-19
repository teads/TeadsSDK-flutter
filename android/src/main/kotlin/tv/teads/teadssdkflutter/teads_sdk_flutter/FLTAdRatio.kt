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
                    val width = args[0] as? Double
                    val requestIdentifier = args[1] as? String
                    if (width != null && requestIdentifier != null)
                        try {
                            result.success(
                                FLTAdInstanceManager.shared.instance(requestIdentifier)
                                    .inReadAdView.inReadAd.adRatio.calculateHeight(width.toInt())
                                    .toDouble()
                            )
                        } catch (e: Exception) {
                            result.error(PluginException.NoAdInstance)
                        }
                    else result.error(PluginException.BadArguments)
                }
            }
            "value" -> {
                (call.arguments as List<*>).let { args ->
                    val width = args[0] as? Double
                    val requestIdentifier = args[1] as? String
                    if (width != null && requestIdentifier != null)
                        try {
                            result.success(
                                FLTAdInstanceManager.shared.instance(requestIdentifier)
                                    .inReadAdView.inReadAd.adRatio.getAdSlotRatio(width.toInt())
                                    .toDouble()
                            )
                        } catch (e: Exception) {
                            result.error(PluginException.NoAdInstance)
                        }
                    else result.error(PluginException.BadArguments)
                }
            }
            else -> result.notImplemented()
        }
    }
}
