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
    
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - ACTIONS
    
    @IBAction func searchNearbyButtonTapped(_ sender: Any) {
    }
    
    
    
    
    
    //MARK: -Helper functions
    
    
    
}
//MARK: - EXTENSTIONS

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations{
            let timeOfLocation = location.timestamp.timeIntervalSinceNow
            guard location.horizontalAccuracy < 20 && abs(timeOfLocation) < 10 else{
                continue
            }
            currentLocation = location
        }
    }
}

