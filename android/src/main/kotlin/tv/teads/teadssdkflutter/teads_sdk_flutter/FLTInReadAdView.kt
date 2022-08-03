package tv.teads.teadssdkflutter.teads_sdk_flutter

import android.content.Context
import android.view.View
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import tv.teads.sdk.renderer.InReadAdView

class FLTInReadAdViewFactory(private val methodChannel: MethodChannel) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val view = FLTInReadAdView(context, viewId, args)
        methodChannel.setMethodCallHandler(view)
        return view
    }
}

internal class FLTInReadAdView(
    private val context: Context?,
    private val viewId: Int,
    private val args: Any?
) : PlatformView, MethodChannel.MethodCallHandler {
    private lateinit var inReadAdView: InReadAdView

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
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
        }
    }

    override fun getView(): View {
        return inReadAdView
    }

    override fun dispose() {
        inReadAdView.clean()
    }
}
