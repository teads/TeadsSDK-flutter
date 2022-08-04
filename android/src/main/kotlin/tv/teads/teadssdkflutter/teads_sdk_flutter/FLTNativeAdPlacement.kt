package tv.teads.teadssdkflutter.teads_sdk_flutter


import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.AdOpportunityTrackerView
import tv.teads.sdk.AdRequestSettings
import tv.teads.sdk.NativeAd
import tv.teads.sdk.NativeAdListener
import java.util.*

class FLTNativeAdPlacement(
    val channel: MethodChannel,
    val adChannel: MethodChannel
) : MethodCallHandler {

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        when (call.method) {
            "requestAd" -> {
                (call.arguments as List<*>).let { args ->
                    val settingsMap = args[0] as? Map<String, Any>
                    val instanceIdentifier = UUID.randomUUID().toString()
                    if (settingsMap != null) {
                        FLTTeadsNativeAdInstanceManager.shared.placement?.requestAd(
                            AdRequestSettings.fromMap(settingsMap),
                            object : NativeAdListener {
                                override fun adOpportunityTrackerView(trackerView: AdOpportunityTrackerView) {
                                    //TODO: add adOpportunityTrackerView
                                }

                                override fun onAdReceived(nativeAd: NativeAd) {
                                    FLTTeadsNativeAdInstanceManager.shared.new(
                                        NativeAdViewInstanceMap(
                                            nativeAd,
                                            instanceIdentifier
                                        )
                                    )
                                    Handler(Looper.getMainLooper()).post {
                                        channel.invokeMethod(
                                            "didReceiveAd",
                                            listOf(instanceIdentifier)
                                        )
                                    }
                                }

                                override fun onAdClicked() {
                                    Handler(Looper.getMainLooper()).post {
                                        adChannel.invokeMethod(
                                            "didRecordClick",
                                            listOf(instanceIdentifier)
                                        )
                                    }
                                }

                                override fun onAdError(code: Int, description: String) {
                                    Handler(Looper.getMainLooper()).post {
                                        adChannel.invokeMethod(
                                            "didCatchError",
                                            listOf(instanceIdentifier)
                                        )
                                    }
                                }

                                override fun onAdImpression() {
                                    Handler(Looper.getMainLooper()).post {
                                        adChannel.invokeMethod(
                                            "didRecordImpression",
                                            listOf(instanceIdentifier)
                                        )
                                    }
                                }

                                override fun onFailToReceiveAd(failReason: String) {
                                    Handler(Looper.getMainLooper()).post {
                                        channel.invokeMethod(
                                            "didFailToReceiveAd",
                                            listOf(failReason)
                                        )
                                    }
                                }
                            })
                        result.success(instanceIdentifier)
                    } else result.error(PluginException.BadArguments)
                }
            }
            else -> result.notImplemented()
        }
    }

}
