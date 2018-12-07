//
//  MapViewController.swift
//  LoginFB
//
//  Created by Macbook on 11/16/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let location = CLLocation()

    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mapa.delegate = self
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        locationManager.startUpdatingLocation()
        mapa.showsUserLocation = true
    }
    

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: mapa.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009))
        
        mapa.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }

}
