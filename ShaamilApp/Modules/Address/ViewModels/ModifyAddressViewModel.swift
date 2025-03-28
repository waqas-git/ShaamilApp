//
//  ModifyAddressViewModel.swift
//  ShaamilApp
//
//  Created by waqas ahmed on 26/03/2025.
//

import SwiftUI
import MapKit
import CoreLocation

@Observable
class ModifyAddressViewModel: NSObject, CLLocationManagerDelegate {
    var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.9544, longitude: 35.9106), // Default to Amman Jordan
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var currentLocation: Location = Location(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
    
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let coordinate = location.coordinate
        currentLocation = Location(coordinate: coordinate)
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
}

// Custom location model for Map Annotation
struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
