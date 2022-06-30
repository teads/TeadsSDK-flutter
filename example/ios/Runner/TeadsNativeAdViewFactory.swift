//
//  TeadsNativeAdViewFactory.swift
//  Runner
//
//  Created by Thibaud Saint-Etienne on 29/06/2022.
//

import TeadsSDK
import teads_sdk_flutter

class TeadsNativeAdViewFactory: FLTTeadsNativeAdFactory {

    func createNativeAd(from nativeAd: TeadsNativeAd) -> TeadsNativeAdView? {
        guard let nibView = Bundle.main.loadNibNamed("TeadsNativeAdView", owner: nil, options: nil)?.first,
              let nativeAdView = nibView as? TeadsNativeAdView else {
            return nil
        }
        return nativeAdView
    }
    
}
