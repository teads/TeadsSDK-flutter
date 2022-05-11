package tv.teads.teadssdkflutter.teads_sdk_flutter

import tv.teads.sdk.AdRatio
import tv.teads.sdk.InReadAd
import tv.teads.sdk.InReadAdPlacement


class FLTAdInstanceManager {
    data class FLTAdInstanceMap(val teadsAd: InReadAd?, val adRatio: AdRatio?)
    public var placement : InReadAdPlacement? = null
    private var list2:MutableList<InReadAd> = mutableListOf()


    fun new(teadsAd: InReadAd) {
        list2.add(teadsAd)
    }

    fun instance(requestIdentifier:String){
        val instance = list2.forEach{}
        return

    }

    companion object{
        public val shared : FLTAdInstanceManager = FLTAdInstanceManager()
    }
}