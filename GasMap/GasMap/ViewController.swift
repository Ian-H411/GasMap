//
//  ViewController.swift
//  GasMap
//
//  Created by Ian Hall on 10/2/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {
    //MARK: -OUTLETS
    @IBOutlet weak var gasMap: MKMapView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    
    //MARK: - Variables
    
    var currentLocation:CLLocation?
    
    let locationManger = LocationManager.shared
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        locationManger.activityType = .automotiveNavigation
        locationManger.startUpdatingLocation()
        
    }
    
    //MARK: - ACTIONS
    
    @IBAction func searchNearbyButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func centerOnLocationButtonTapped(_ sender: Any) {
        guard let location = currentLocation else {return}
        centerMapOnLocation(location: location, regionRadius: 12000)
    }
    
    
    
    
    //MARK: -Helper functions
    func centerMapOnLocation(location:CLLocation,regionRadius:CLLocationDistance){
     
        let region:MKCoordinateRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        gasMap.setRegion(region, animated: true)
        
    }
    
    
}
//MARK: - EXTENSTIONS

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations{
//            let timeOfLocation = location.timestamp.timeIntervalSinceNow
//            guard location.horizontalAccuracy < 20 && abs(timeOfLocation) < 10 else{
//                continue
//            }
            guard let _ = currentLocation else {
                centerMapOnLocation(location: location, regionRadius: 12000)
                currentLocation = location
                continue
                
            }
            currentLocation = location
        }
    }
}

