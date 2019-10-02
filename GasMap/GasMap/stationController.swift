//
//  stationController.swift
//  GasMap
//
//  Created by Ian Hall on 10/2/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
class StationController {
    
    static let shared = StationController()
    
    let stations = [Station]()
    
   
    
    func retrieveStations (location: CLLocation, radius: CLLocationDistance){
        var baseUrl = URL(fileURLWithPath: "http://devapi.mygasfeed.com/stations/radius/")
        let lattitude = "\(location.coordinate.latitude)"
        let longitude = "\(location.coordinate.longitude)"
        let radius = "\(Measurement(value: radius, unit: UnitLength.meters).converted(to: UnitLength.miles))"
        let fuelType = "reg"
        let filter = "distance"
        let apiKey = "rfej9napna"
        
        baseUrl.appendPathComponent(lattitude)
        baseUrl.appendPathComponent(longitude)
        baseUrl.appendPathComponent(radius)
        baseUrl.appendPathComponent(fuelType)
        baseUrl.appendPathComponent(filter)
        baseUrl.appendPathComponent(apiKey)
        print(baseUrl)
    }
    
}
