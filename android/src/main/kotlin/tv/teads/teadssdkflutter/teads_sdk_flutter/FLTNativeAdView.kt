package tv.teads.teadssdkflutter.teads_sdk_flutter

import android.content.Context
import android.view.View
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import tv.teads.sdk.renderer.NativeAdView

class FLTNativeAdViewFactory(private val platformView: PlatformView) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return platformView
    }
}

internal class FLTNativeAdView() : PlatformView, MethodChannel.MethodCallHandler {
    private lateinit var nativeAdView: NativeAdView

    init {
        //        (args as HashMap<*, *>).let {
//            (args["factoryId"] as? String).let { factoryId ->
//                nativeAdView = TeadsSdkFlutterPlugin.shared.nativeAdViewFactories[factoryId]?.teadsNativeAdView()
//            }
//        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "bind" -> {
                nativeAdView = TeadsSdkFlutterPlugin.shared.nativeAdViewFactories["exampleNativeAd"]?.teadsNativeAdView()!!
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
        }
    }

    override fun getView(): View {
        return nativeAdView
    }

    override fun dispose() { }
}
