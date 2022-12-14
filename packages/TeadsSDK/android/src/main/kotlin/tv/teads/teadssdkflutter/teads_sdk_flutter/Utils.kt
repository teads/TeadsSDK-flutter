package tv.teads.teadssdkflutter.teads_sdk_flutter

import io.flutter.plugin.common.MethodChannel

class PluginException constructor(
    val code: String,
    val message: String,
    val details: Any?
) {
    companion object {
        val NoAdInstance = PluginException("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        val BadArguments = PluginException("BAD_ARGS", "Wrong argument types", null)
    }
}

fun MethodChannel.Result.error(exception: PluginException) {
    error(exception.code, exception.message, exception.details)
}