//
//  LocationManager.swift
//  Project
//
//  Created by a mystic on 10/10/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedWhenInUse:
                authorizationStatus = .authorizedWhenInUse
                locationManager.requestLocation()
            case .restricted, .denied:
                print("error")
            case .notDetermined:
                authorizationStatus = .notDetermined
                manager.requestWhenInUseAuthorization()
            default:
                break
        }
    }
}
