//
//  FLTTeadsSDKFlutterPlugin.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 30/06/2022.
//

import Foundation

public class FLTTeadsSDKFlutterPlugin: NSObject, FlutterPlugin {
    
    static let shared = FLTTeadsSDKFlutterPlugin()
    var nativeAdViewFactories = [String: FLTTeadsNativeAdViewFactoryProtocol]()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        registrar.publish(Self.shared)
        FLTTeads.register(with: registrar)
        FLTTeadsAdPlacementSettings.register(with: registrar)
        FLTTeadsAdRequestSettings.register(with: registrar)
        FLTTeadsInReadAdPlacement.register(with: registrar)
        FLTTeadsNativeAdPlacement.register(with: registrar)
        FLTTeadsAd.register(with: registrar)
        FLTTeadsAdRatio.register(with: registrar)
        let inReadAdViewFactory = FLTTeadsInReadAdViewFactory(messenger: registrar.messenger())
        registrar.register(inReadAdViewFactory, withId: "FLTTeadsInReadAdView")
        let nativeAdViewFactory = FLTTeadsNativeAdViewFactory(messenger: registrar.messenger())
        registrar.register(nativeAdViewFactory, withId: "FLTTeadsNativeAdView")
    }
    
    @discardableResult
    public static func registerNativeAdViewFactory(registry: FlutterPluginRegistry, factoryId: String, nativeAdViewFactory: FLTTeadsNativeAdViewFactoryProtocol) -> Bool {
        if (Self.shared.nativeAdViewFactories[factoryId] != nil) {
            print("A NativeAdFactory with the following factoryId already exists: \(factoryId)")
            return false
        } else {
            Self.shared.nativeAdViewFactories[factoryId] = nativeAdViewFactory
            return true
        }
    }
    
    @discardableResult
    public static func unregisterNativeAdViewFactory(registry: FlutterPluginRegistry, factoryId: String) -> FLTTeadsNativeAdViewFactoryProtocol? {
        let factory = Self.shared.nativeAdViewFactories[factoryId]
        Self.shared.nativeAdViewFactories[factoryId] = nil
        return factory
    }
}
