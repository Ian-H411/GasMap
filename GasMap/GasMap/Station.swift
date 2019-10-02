//
//  Station.swift
//  GasMap
//
//  Created by Ian Hall on 10/2/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation
import CoreLocation

struct Station: Decodable{
    
    let lattitude:Double
    
    let longitude:Double
    
    var CLLocationPoint: CLLocation{
        return CLLocation(latitude: lattitude, longitude: longitude)
    }
    
    let name: String
    
    let regPrice:String
    
    let midPrice:String
    
    let premiumPrice:String
    
    private enum CodingKeys: String,CodingKey{
        case lattitude = "lat"
        case longitude = "lng"
        case name = "station"
        case regPrice = "reg_price"
        case midPrice = "mid_price"
        case premiumPrice = "pre_price"
        
    }
    
}
