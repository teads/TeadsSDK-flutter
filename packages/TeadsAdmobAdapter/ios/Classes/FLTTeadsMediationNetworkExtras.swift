//
//  FLTTeadsMediationNetworkExtras.swift
//  teads_admob_adapter
//
//  Created by Thibaud Saint-Etienne on 18/10/2022.
//

import Flutter
import google_mobile_ads
import TeadsAdMobAdapter
import TeadsSDK

public class FLTTeadsMediationNetworkExtras: FLTMediationNetworkExtrasProvider {
        
    public init() { }
    
    public func getMediationExtras(_ adUnitId: String, mediationExtrasIdentifier: String?) -> [GADAdNetworkExtras]? {
        return [FLTTeadsAdapterSettings.instance.adapterSettings]
    }
    
}
