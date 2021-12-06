//
//  LocationHelper.swift
//  OneShop
//
//  Created by Anais Zulfequar on 2021-12-04.
//

import Foundation
import CoreLocation
import MapKit
import Contacts

class LocationHelper: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var address : String = "unknown"
    @Published var currentLocation : CLLocation?
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    private var lastSeenLocation : CLLocation?
    
    override init(){
        super.init()
        
        if(CLLocationManager.locationServicesEnabled()){
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
        
        checkPermission()
        
        if(CLLocationManager.locationServicesEnabled() && (self.authorizationStatus == .authorizedAlways || self.authorizationStatus == .authorizedWhenInUse)){
            self.locationManager.startUpdatingLocation()
        }else{
            self.requestPermission()
        }
    }
    
    deinit{
        self.locationManager.stopUpdatingLocation()
    }
    
    func requestPermission(){
        if(CLLocationManager.locationServicesEnabled()){
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func checkPermission(){
        print(#function, "Checking for permission")
        
        switch self.locationManager.authorizationStatus{
        case .denied:
            //request permission
            self.requestPermission()
        case.notDetermined:
            self.requestPermission()
        case .restricted:
            self.requestPermission()
        case .authorizedAlways:
            //get location updates
            self.locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            //get location updates
            self.locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function, "Authoriation Status : \(manager.authorizationStatus.rawValue)")
        self.authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
                         [CLLocation]){
        
        if locations.last != nil{
            //most recent
            self.currentLocation = locations.last!
        }else{
            //oldest known
            self.currentLocation = locations.first
        }
        
        self.lastSeenLocation = locations.first
        print(#function, "Last seen location: \(self.lastSeenLocation)")
        print(#function, "Current Location: \(self.currentLocation)")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function, "Error : \(error.localizedDescription) ")
    }
    
    func addPinToMapView(mapView: MKMapView, coordinates: CLLocationCoordinate2D, title: String?){
        
        let mapAnnoation = MKPointAnnotation()
        mapAnnoation.coordinate = coordinates
        
        if let title = title {
            mapAnnoation.title = title
        }else{
            mapAnnoation.title = self.address
        }
        mapView.addAnnotation(mapAnnoation)
    }
    
    func doForwardGeocoding(address: String, completionHandler: @escaping(CLLocation?, NSError?) -> Void){
        
        self.geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) in
            //CLPlacemark
            
            if error != nil{
                completionHandler(nil, error as NSError?)
            }else{
                if let placemark = placemarks?.first{
                    let location = placemark.location!
                    
                    print(#function, "Location: \(location)")
                    
                    completionHandler(location, nil)
                    return
                }
                completionHandler(nil, error as NSError?)
            }
        })
        
    }
}

