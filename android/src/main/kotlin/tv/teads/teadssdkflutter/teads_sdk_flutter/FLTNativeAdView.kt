package tv.teads.teadssdkflutter.teads_sdk_flutter

import android.content.Context
import android.view.View
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import tv.teads.sdk.renderer.NativeAdView

class FLTNativeAdViewFactory(private val methodChannel: MethodChannel) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    private var nativeAdView: NativeAdView? = null

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        (args as HashMap<*, *>).let {
            (args["factoryId"] as? String).let { factoryId ->
                nativeAdView =
                    TeadsSdkFlutterPlugin.shared.nativeAdViewFactories[factoryId]?.teadsNativeAdView()
            }
        }

        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "bind" -> {
                    (call.arguments as List<*>).let { args ->
                        val requestIdentifier = args[0] as? String
                        if (requestIdentifier != null) {
                            FLTTeadsNativeAdInstanceManager.shared.instance(requestIdentifier).nativeAd.let {
                                nativeAdView?.bind(it)
                            }
                            result.success(null)
                        } else
                            result.error(PluginException.BadArguments)
                    }
                }
                "clean" -> {
                    nativeAdView?.let {
                        FLTTeadsNativeAdInstanceManager.shared.clean(it)
                    }
                    result.success(null)
                }
            }
        }
        return FLTNativeAdView(context, nativeAdView)
    }
}

internal class FLTNativeAdView(
    private val context: Context?,
    private val nativeAdView: NativeAdView?
) : PlatformView {

    override fun getView(): View {
        return nativeAdView ?: View(context)
    }

    override fun dispose() {
        // Nothing for now
    }
}
