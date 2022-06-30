//
//  FLTTeadsNativeAdFactory.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 29/06/2022.
//

import Flutter
import TeadsSDK

@objc
public protocol FLTTeadsNativeAdFactory {
    /// Creates a `TeadsNativeAdView` with a `TeadsNativeAd`.
    /// - parameters:
    ///     - nativeAd: Ad information used to create a `TeadsNativeAd`.
    /// - returns: A `TeadsNativeAdView` that is overlaid on top of the FlutterView.
    func createNativeAd(from nativeAd: TeadsNativeAd) -> TeadsNativeAdView?
}
