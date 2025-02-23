//
//  LocationManager.swift
//  Weather
//
//  Created by Dwistari on 26/11/24.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 10
    }
    
    
    func requestLocation() {
        let authorizationStatus = manager.authorizationStatus
        if authorizationStatus == .notDetermined {
            manager.requestAlwaysAuthorization()
            print(".notDetermined")
        } else if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            isLoading = true
            manager.requestLocation()
        } else {
            print("Location access denied or restricted.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error location", error.localizedDescription)
        isLoading = false
    }
    
    // Delegate: Handle authorization changes
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            isLoading = true
            manager.requestLocation()
            print("Location access granted.")
        case .denied, .restricted:
            print("Location access denied or restricted.")
        case .notDetermined:
            print("Authorization not determined.")
        @unknown default:
            print("Unknown authorization status.")
        }
    }
    
}
