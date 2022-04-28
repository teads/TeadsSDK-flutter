//
//  FLTTeadsInReadAdPlacement.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

import Flutter
import TeadsSDK

public class FLTTeadsInReadAdPlacement: NSObject, FlutterPlugin {
    
    static var channel: FlutterMethodChannel?
        
    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_inread_ad_placement", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsInReadAdPlacement()
        if let channel = channel {
          registrar.addMethodCallDelegate(instance, channel: channel)
        }
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "requestAd":
            if let args = call.arguments as? [Any],
               let settingsMap = args[0] as? [String: Any],
               let data = try? JSONSerialization.data(withJSONObject: settingsMap, options: .prettyPrinted) {
                let decoder = JSONDecoder()
                if let settings = try? decoder.decode(TeadsAdRequestSettings.self, from: data) {
                    FLTTeads.placement?.delegate = self
                    FLTTeads.placement?.requestAd(requestSettings: settings)
                    result("")
                }
            } else {
                result(
                  FlutterError.init(
                      code: "BAD_ARGS",
                      message: "Wrong argument types",
                      details: nil
                  )
                )
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

extension FLTTeadsInReadAdPlacement: TeadsInReadAdPlacementDelegate {
    
    public func didReceiveAd(ad: TeadsInReadAd, adRatio: TeadsAdRatio) {
        Self.channel?.invokeMethod("didReceiveAd", arguments: [])
    }
    
    public func didUpdateRatio(ad: TeadsInReadAd, adRatio: TeadsAdRatio) {
        Self.channel?.invokeMethod("didUpdateRatio", arguments: [])
    }
    
    public func didFailToReceiveAd(reason: AdFailReason) {
        Self.channel?.invokeMethod("didFailToReceiveAd", arguments: [])
    }
    
    public func adOpportunityTrackerView(trackerView: TeadsAdOpportunityTrackerView) {
        Self.channel?.invokeMethod("adOpportunityTrackerView", arguments: [])
    }
    
}
