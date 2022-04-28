//
//  FLTTeadsAdPlacementSettings.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 27/04/2022.
//

import Flutter
import TeadsSDK

public class FLTTeadsAdPlacementSettings: NSObject, FlutterPlugin {
    
    let bridgeInstance = TeadsAdPlacementSettings()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_placement_settings", binaryMessenger: registrar.messenger())
        let instance = FLTTeadsAdPlacementSettings()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "disableCrashMonitoring":
            bridgeInstance.disableCrashMonitoring()
            result(try? bridgeInstance.asDictionary())
        case "disableTeadsAudioSessionManagement":
            bridgeInstance.disableTeadsAudioSessionManagement()
            result(try? bridgeInstance.asDictionary())
        case "enableDebug":
            bridgeInstance.enableDebug()
            result(try? bridgeInstance.asDictionary())
        case "userConsent":
            if let args = call.arguments as? [Any],
               let subjectToGDPR = args[0] as? String,
               let consent = args[1] as? String,
               let tcfVersionRawValue = args[2] as? Int,
               let tcfVersion = TCFVersion(rawValue: tcfVersionRawValue),
               let cmpSdkID = args[3] as? Int {
                bridgeInstance.userConsent(subjectToGDPR: subjectToGDPR, consent: consent, tcfVersion: tcfVersion, cmpSdkID: cmpSdkID)
                result(try? bridgeInstance.asDictionary())
            } else {
                result(
                  FlutterError.init(
                      code: "BAD_ARGS",
                      message: "Wrong argument types",
                      details: nil
                  )
                )
            }
        case "setUsPrivacy":
            if let args = call.arguments as? [Any],
               let consent = args[0] as? String {
                bridgeInstance.setUsPrivacy(consent: consent)
                result(try? bridgeInstance.asDictionary())
            } else {
                result(
                  FlutterError.init(
                      code: "BAD_ARGS",
                      message: "Wrong argument types",
                      details: nil
                  )
                )
            }
        case "disableBatteryMonitoring":
            bridgeInstance.disableBatteryMonitoring()
            result(try? bridgeInstance.asDictionary())
        case "addExtras":
            if let args = call.arguments as? [Any],
               let value = args[0] as? String,
               let key = args[1] as? String {
                bridgeInstance.addExtras(value, for: key)
                result(try? bridgeInstance.asDictionary())
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
