package tv.teads.teadssdkflutter.teads_sdk_flutter

import tv.teads.sdk.InReadAdPlacement
import tv.teads.sdk.NativeAd
import tv.teads.sdk.NativeAdPlacement
import tv.teads.sdk.renderer.InReadAdView
import tv.teads.sdk.renderer.NativeAdView

class InReadAdViewInstanceMap constructor(val inReadAdView: InReadAdView, val id: String)

class FLTTeadsInReadAdInstanceManager {
    var placement: InReadAdPlacement? = null
    private var adViewInstancesMapList: MutableList<InReadAdViewInstanceMap> = mutableListOf()

    fun new(instance: InReadAdViewInstanceMap) {
        adViewInstancesMapList.add(instance)
    }

    @Throws()
    fun instance(requestIdentifier: String): InReadAdViewInstanceMap {
        val instance = adViewInstancesMapList.firstOrNull { it.id == requestIdentifier }
        if (instance != null) {
            return instance
        } else {
            throw Exception()
        }
    }

    fun clean(inReadAdView: InReadAdView) {
        inReadAdView.clean()
        adViewInstancesMapList.removeIf { it.inReadAdView == inReadAdView }
    }

    companion object {
        val shared: FLTTeadsInReadAdInstanceManager = FLTTeadsInReadAdInstanceManager()
    }
}

class NativeAdViewInstanceMap constructor(val nativeAd: NativeAd, val id: String)

class FLTTeadsNativeAdInstanceManager {
    var placement: NativeAdPlacement? = null
    private var list: MutableList<NativeAdViewInstanceMap> = mutableListOf()

    fun new(instance: NativeAdViewInstanceMap) {
        list.add(instance)
    }

    @Throws()
    fun instance(requestIdentifier: String): NativeAdViewInstanceMap {
        val instance = list.firstOrNull { it.id == requestIdentifier }
        if (instance != null) {
            return instance
        } else {
            throw Exception()
        }
    }

    fun clean(nativeAdView: NativeAdView) {
        nativeAdView.clean()
        list.removeIf { it.nativeAd == nativeAdView.nativeAd }
    }

    companion object {
        val shared: FLTTeadsNativeAdInstanceManager = FLTTeadsNativeAdInstanceManager()
    }
}