package tv.teads.teadssdkflutter.teads_sdk_flutter

import tv.teads.sdk.InReadAd
import tv.teads.sdk.InReadAdListener
import tv.teads.sdk.InReadAdPlacement
import tv.teads.sdk.renderer.InReadAdView
import java.lang.Error
import java.util.*

class AdInstanceMap constructor(val inReadAdView: InReadAdView, val id: UUID)

class FLTAdInstanceManager {
    var placement: InReadAdPlacement? = null
    private var list: MutableList<AdInstanceMap> = mutableListOf()


    fun new(instance: AdInstanceMap) {
        list.add(instance)
    }

    fun instance(requestIdentifier: String): AdInstanceMap {
        val instance = list.first { it.inReadAdView.inReadAd.requestIdentifier.toString() == requestIdentifier }
        if (instance != null)
            return instance
        else
            throw Error()
    }

    fun instance(instanceIdentifier: UUID): AdInstanceMap {
        val instance = list.first { it.id == instanceIdentifier }
        if (instance != null)
            return instance
        else
            throw Error()
    }

    companion object {
        val shared: FLTAdInstanceManager = FLTAdInstanceManager()
    }
}
