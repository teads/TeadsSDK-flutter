package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.AdRequestSettings

class FLTAdRequestSettings : MethodCallHandler {

    private val adRequestSettings = AdRequestSettings.Builder()

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "enableValidationMode" -> {
                result.success(adRequestSettings.enableValidationMode().build().toMap())
            }
            "pageUrl" -> {
                (call.arguments as List<*>).let { args ->
                    val urlString = args[0] as? String
                    if (urlString != null)
                        result.success(adRequestSettings.pageSlotUrl(urlString).build().toMap())
                    else result.error(PluginException.BadArguments)
                }
            }
            "addExtras" -> {
                (call.arguments as List<*>).let { args ->
                    val value = args[0] as? String
                    val key = args[1] as? String
                    if (value != null && key != null)
                        result.success(adRequestSettings.addExtra(value, key).build().toMap())
                    else result.error(PluginException.BadArguments)
                }
            }
            else -> result.notImplemented()
        }
    }

}
