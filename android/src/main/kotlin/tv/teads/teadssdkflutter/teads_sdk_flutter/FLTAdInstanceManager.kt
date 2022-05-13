package tv.teads.teadssdkflutter.teads_sdk_flutter

import tv.teads.sdk.InReadAd
import tv.teads.sdk.InReadAdPlacement


class FLTAdInstanceManager {
    var placement: InReadAdPlacement? = null
    private var list2: MutableList<InReadAd> = mutableListOf()


    fun new(teadsAd: InReadAd) {
        list2.add(teadsAd)
    }

    fun instance(): InReadAd {
        val instance = list2.first()
        return instance
    }

    companion object {
        val shared: FLTAdInstanceManager = FLTAdInstanceManager()
    }
}
