package tv.teads.teadssdkflutter.teads_sdk_flutter

import android.content.Context
import android.view.View
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import tv.teads.sdk.renderer.InReadAdView

class FLTInReadAdViewFactory(methodChannel: MethodChannel) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    private lateinit var inReadAdView: InReadAdView

    init {
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "bind" -> {
                    (call.arguments as List<*>).let { args ->
                        val requestIdentifier = args[0] as? String
                        if (requestIdentifier != null) {
                            inReadAdView =
                                FLTTeadsInReadAdInstanceManager.shared.instance(requestIdentifier).inReadAdView
                            result.success(null)
                        } else
                            result.error(PluginException.BadArguments)
                    }
                }
                "clean" -> {
                    FLTTeadsInReadAdInstanceManager.shared.clean(inReadAdView)
                    result.success(null)
                }
            }
        }
    }

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return FLTInReadAdView(inReadAdView)
    }
}

internal class FLTInReadAdView(private val inReadAdView: InReadAdView) : PlatformView {

    override fun getView(): View {
        return inReadAdView
    }

    override fun dispose() {
        // Dispose is handled by a method call
    }
}
