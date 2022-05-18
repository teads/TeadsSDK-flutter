package tv.teads.teadssdkflutter.teads_sdk_flutter


import android.os.Handler
import android.os.Looper
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
                    val instanceIdentifier = UUID.randomUUID().toString()
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
                                        FLTAdInstanceManager.shared.new(
                                            AdInstanceMap(
                                                inReadAdView,
                                                instanceIdentifier
                                            )
                                        )
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdPlacement.invokeMethod(
                                                "didReceiveAd",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onAdClicked() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didRecordClick",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onAdClosed() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didClose",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onAdError(code: Int, description: String) {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didCatchError",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onAdImpression() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didRecordImpression",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onAdExpandedToFullscreen() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didExpandedToFullscreen",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onAdCollapsedFromFullscreen() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didCollapsedFromFullscreen",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onAdRatioUpdate(adRatio: AdRatio) {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdPlacement.invokeMethod(
                                                "didUpdateRatio",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onFailToReceiveAd(failReason: String) {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdPlacement.invokeMethod(
                                                "didFailToReceiveAd",
                                                listOf("")
                                            )
                                        }
                                    }
                                },
                                object : VideoPlaybackListener {
                                    override fun onVideoComplete() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didComplete",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onVideoPause() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didPause",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                    override fun onVideoPlay() {
                                        Handler(Looper.getMainLooper()).post {
                                            channelAdRequest.invokeMethod(
                                                "didPlay",
                                                listOf(instanceIdentifier)
                                            )
                                        }
                                    }

                                })
                            result.success(instanceIdentifier)
                    } else result.error("BAD_ARGS", "Wrong argument types", null)
                }
            }
            else -> result.error("NO_AD_INSTANCE", "Unable to find an ad instance", null)
        }
    }

}
