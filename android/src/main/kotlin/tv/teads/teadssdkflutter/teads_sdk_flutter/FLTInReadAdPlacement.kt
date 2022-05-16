package tv.teads.teadssdkflutter.teads_sdk_flutter


import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tv.teads.sdk.*
import tv.teads.sdk.renderer.InReadAdView
import java.util.*

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
                    val instanceIdentifier = UUID.randomUUID()
                    if (settingsMap != null) {
                        val requestIdentifier =
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
                                        FLTAdInstanceManager.shared.new(
                                            AdInstanceMap(
                                                inReadAdView,
                                                instanceIdentifier
                                            )
                                        )
                                        channelAdPlacement.invokeMethod(
                                            "didReceiveAd",
                                            listOf(inReadAdView.inReadAd.requestIdentifier.toString())
                                        )
                                    }

                                    override fun onAdClicked() {
                                        channelAdRequest.invokeMethod(
                                            "didRecordClick",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                    override fun onAdClosed() {
                                        channelAdRequest.invokeMethod(
                                            "didClose",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                    override fun onAdError(code: Int, description: String) {
                                        channelAdRequest.invokeMethod(
                                            "didCatchError",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString(),
                                                description
                                            )
                                        )
                                    }

                                    override fun onAdImpression() {
                                        channelAdRequest.invokeMethod(
                                            "didRecordImpression",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                    override fun onAdExpandedToFullscreen() {
                                        channelAdRequest.invokeMethod(
                                            "didExpandedToFullscreen",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                    override fun onAdCollapsedFromFullscreen() {
                                        channelAdRequest.invokeMethod(
                                            "didCollapsedFromFullscreen",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                    override fun onAdRatioUpdate(adRatio: AdRatio) {
                                        channelAdPlacement.invokeMethod(
                                            "didUpdateRatio",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
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
                                        channelAdRequest.invokeMethod(
                                            "didComplete",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                    override fun onVideoPause() {
                                        channelAdRequest.invokeMethod(
                                            "didPause",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                    override fun onVideoPlay() {
                                        channelAdRequest.invokeMethod(
                                            "didPlay",
                                            listOf(
                                                FLTAdInstanceManager.shared.instance(
                                                    instanceIdentifier
                                                ).inReadAdView.inReadAd.requestIdentifier.toString()
                                            )
                                        )
                                    }

                                })
                        result.success(requestIdentifier.toString())
                    } else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            else -> result.error("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        }
    }

}
