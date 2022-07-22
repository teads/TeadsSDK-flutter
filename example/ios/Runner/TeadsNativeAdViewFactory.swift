//
//  TeadsNativeAdViewFactory.swift
//  Runner
//
//  Created by Thibaud Saint-Etienne on 29/06/2022.
//

import TeadsSDK
import teads_sdk_flutter

class TeadsNativeAdViewFactory: FLTTeadsNativeAdViewFactoryProtocol {

    func teadsNativeAdView() -> TeadsNativeAdView? {
        guard let nibView = Bundle.main.loadNibNamed("TeadsNativeAdView", owner: nil, options: nil)?.first,
              let nativeAdView = nibView as? TeadsNativeAdView else {
            return nil
        }
        // media view
        nativeAdView.mediaView?.layer.cornerRadius = 20
        nativeAdView.mediaView?.layer.masksToBounds = true
        // call to action
        nativeAdView.callToActionButton?.layer.cornerRadius = 16
        // icon
        nativeAdView.iconImageView?.layer.cornerRadius = 30
        return nativeAdView
    }
    
}
