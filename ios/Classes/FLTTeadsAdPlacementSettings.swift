//
//  FLTTeadsAdPlacementSettings.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 27/04/2022.
//

import Flutter
import TeadsSDK

public class FLTTeadsAdPlacementSettings: NSObject, FlutterPlugin {
    
    let placementSettings = TeadsAdPlacementSettings()
    
    public override init() {
        super.init()
        placementSettings.addExtras(TeadsAdPlacementSettings.platformKey, for: TeadsAdPlacementSettings.platformFlutter)
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_placement_settings", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsAdPlacementSettings()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "disableCrashMonitoring":
            placementSettings.disableCrashMonitoring()
            result(try? placementSettings.asDictionary())
        case "disableTeadsAudioSessionManagement":
            placementSettings.disableTeadsAudioSessionManagement()
            result(try? placementSettings.asDictionary())
        case "enableDebug":
            placementSettings.enableDebug()
            result(try? placementSettings.asDictionary())
        case "userConsent":
            if let args = call.arguments as? [Any],
               let subjectToGDPR = args[0] as? String,
               let consent = args[1] as? String,
               let tcfVersionRawValue = args[2] as? Int,
               let tcfVersion = TCFVersion(rawValue: tcfVersionRawValue),
               let cmpSdkID = args[3] as? Int {
                placementSettings.userConsent(subjectToGDPR: subjectToGDPR, consent: consent, tcfVersion: tcfVersion, cmpSdkID: cmpSdkID)
                result(try? placementSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "setUsPrivacy":
            if let args = call.arguments as? [Any],
               let consent = args[0] as? String {
                placementSettings.setUsPrivacy(consent: consent)
                result(try? placementSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "disableBatteryMonitoring":
            placementSettings.disableBatteryMonitoring()
            result(try? placementSettings.asDictionary())
        case "addExtras":
            if let args = call.arguments as? [Any],
               let value = args[0] as? String,
               let key = args[1] as? String {
                placementSettings.addExtras(value, for: key)
                result(try? placementSettings.asDictionary())
            } else {
                result(FlutterError.badArguments)
            }
        case "enableLocation":
            // Android only
            result(try? placementSettings.asDictionary())
        case "useLightEndScreen":
            // Android only
            result(try? placementSettings.asDictionary())
        case "hideBrowserUrl":
            // Android only
            result(try? placementSettings.asDictionary())
        case "toolBarBackgroundColor":
            // Android only
            result(try? placementSettings.asDictionary())
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
