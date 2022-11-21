//
//  FLTTeadsInReadAdView.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 28/04/2022.
//

import Flutter
import UIKit
import TeadsSDK

@objc
public class FLTTeadsInReadAdViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    @objc
    public init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLTTeadsInReadAdView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

public class FLTTeadsInReadAdView: NSObject, FlutterPlatformView {
    private var inReadAdView: TeadsInReadAdView?

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        inReadAdView = TeadsInReadAdView()
        
        super.init()
        
        let channel = FlutterMethodChannel(name: "teads_sdk_flutter/teads_ad_view/inread", binaryMessenger: messenger!)
           channel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
               switch(call.method) {
               case "bind":
                   if let args = call.arguments as? [Any],
                      let requestIdentifier = args[0] as? String {
                       if let instance = try? FLTTeadsInReadAdInstanceManager.shared.instance(for: requestIdentifier) {
                           self?.inReadAdView?.bind(instance.teadsAd)
                       }
                       result(nil)
                   } else {
                       result(FlutterError.badArguments)
                   }
               case "dispose":
                   if let args = call.arguments as? [Any],
                      let requestIdentifier = args[0] as? String {
                       FLTTeadsInReadAdInstanceManager.shared.removeInstance(for: requestIdentifier)
                       result(nil)
                   } else {
                       result(FlutterError.badArguments)
                   }
               default:
                   result(FlutterMethodNotImplemented)
               }
           })
    }

    public func view() -> UIView {
        return inReadAdView ?? UIView()
    }
    
}
