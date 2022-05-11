package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.*
import tv.teads.sdk.renderer.InReadAdView

/** FLTInReadAdPlacement */
class FLTInReadAdPlacement(
    val channelAdPlacement: MethodChannel,
    val channelAdRequest: MethodChannel
) : MethodCallHandler {

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        when (call.method) {
            "requestAd" -> {
                (call.arguments as List<*>).let { args ->
                    val settingsMap = args[0] as? Map<String, Any>
                    if (settingsMap != null) {
                        FLTAdInstanceManager.shared.placement?.requestAd(AdRequestSettings.fromMap(
                            settingsMap
                        ),
                            object : InReadAdListener {
                                override fun adOpportunityTrackerView(trackerView: AdOpportunityTrackerView) {
                                    //channel.invokeMethod("adOpportunityTrackerView")
                                }

                                override fun onAdReceived(
                                    inReadAdView: InReadAdView,
                                    adRatio: AdRatio
                                ) {
                                    channelAdPlacement.invokeMethod("didReceiveAd", listOf(""))
                                }

                                override fun onAdClicked() {
                                    channelAdRequest.invokeMethod("didRecordClick", null)
                                }

                                override fun onAdClosed() {
                                    channelAdRequest.invokeMethod("didClose", null)
                                }

                                override fun onAdError(code: Int, description: String) {
                                    channelAdRequest.invokeMethod("didCatchError", listOf(""))
                                }

                                override fun onAdImpression() {
                                    channelAdRequest.invokeMethod("didRecordImpression", null)
                                }

                                override fun onAdExpandedToFullscreen() {
                                    channelAdRequest.invokeMethod("didExpandedToFullscreen", null)
                                }

                                override fun onAdCollapsedFromFullscreen() {
                                    channelAdRequest.invokeMethod(
                                        "didCollapsedFromFullscreen",
                                        null
                                    )
                                }

                                override fun onAdRatioUpdate(adRatio: AdRatio) {
                                    channelAdPlacement.invokeMethod("didUpdateRatio", listOf(""))
                                }

                                override fun onFailToReceiveAd(failReason: String) {
                                    channelAdPlacement.invokeMethod(
                                        "didFailToReceiveAd",
                                        listOf("")
                                    )
                                }
                            },
                            object : VideoPlaybackListener {
                                override fun onVideoComplete() {
                                    channelAdRequest.invokeMethod("didComplete", null)
                                }

                                override fun onVideoPause() {
                                    channelAdRequest.invokeMethod("didPause", null)
                                }

                                override fun onVideoPlay() {
                                    channelAdRequest.invokeMethod("didPlay", null)
                                }

                            })
                        result.success("request ad on placement")
                    }
                    // a implémenté avec adInstance Manager
                    else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            else -> result.error("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        }
    }

}
