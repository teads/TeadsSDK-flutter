//
//  FLTTeadsAdInstanceManager.swift
//  teads_sdk_flutter
//
//  Created by Thibaud Saint-Etienne on 02/05/2022.
//

import Foundation
import TeadsSDK

struct FLTInReadAdInstanceMap {
  let teadsAd: TeadsInReadAd
  let adRatio: TeadsAdRatio
}

class FLTTeadsInReadAdInstanceManager {
    static let shared = FLTTeadsInReadAdInstanceManager()
    var placement: TeadsInReadAdPlacement?
    private var list = [FLTInReadAdInstanceMap]()
    
    func new(instance: FLTInReadAdInstanceMap) {
        list.append(instance)
    }
    
    func instance(for requestIdentifier: String) throws -> FLTInReadAdInstanceMap {
        if let instance = list.first(where: { $0.teadsAd.requestIdentifier.uuidString == requestIdentifier }) {
            return instance
        } else {
            throw NSError()
        }
    }
    
    func clean(with requestIdentifier: String) {
        list.removeAll { $0.teadsAd.requestIdentifier.uuidString == requestIdentifier }
    }
}

class FLTTeadsNativeAdInstanceManager {
    static let shared = FLTTeadsNativeAdInstanceManager()
    var placement: TeadsNativeAdPlacement?
    private var list = [TeadsNativeAd]()
    
    func new(ad: TeadsNativeAd) {
        list.append(ad)
    }
    
    func ad(for requestIdentifier: String) throws -> TeadsNativeAd {
        if let ad = list.first(where: { $0.requestIdentifier.uuidString == requestIdentifier }) {
            return ad
        } else {
            throw NSError()
        }
    }
    
    func clean(with requestIdentifier: String) {
        list.removeAll { $0.requestIdentifier.uuidString == requestIdentifier }
    }
}
