package tv.teads.teadssdkflutter.teads_sdk_flutter

import tv.teads.sdk.InReadAdPlacement
import tv.teads.sdk.renderer.InReadAdView

class AdInstanceMap constructor(val inReadAdView: InReadAdView, val id: String)

class FLTAdInstanceManager {
    var placement: InReadAdPlacement? = null
    private var adViewInstancesMapList: MutableList<AdInstanceMap> = mutableListOf()

    fun new(instance: AdInstanceMap) {
        adViewInstancesMapList.add(instance)
    }

    @Throws()
    fun instance(requestIdentifier: String) : AdInstanceMap {
        val instance = adViewInstancesMapList.firstOrNull { it.id == requestIdentifier }
        if (instance != null) {
            return instance
        } else {
            throw Exception()
        }
    }

    companion object {
        val shared: FLTAdInstanceManager = FLTAdInstanceManager()
    }
}
