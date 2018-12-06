//
//  MapViewController.swift
//  LoginFB
//
//  Created by Macbook on 11/16/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import UserNotifications
class MapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate , UNUserNotificationCenterDelegate{
    
    let locationManager = CLLocationManager()
    let location = CLLocation()
    let geocoder = CLGeocoder()
    var adress = ""


    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        UNUserNotificationCenter.current().delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        self.mapa.delegate = self

        mapa.delegate = self
        mapa.showsScale = true
        mapa.showsPointsOfInterest = true
        mapa.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        
     
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(action(gestureRecognizer:)))
       mapa.addGestureRecognizer(tapGesture)
        
    }
    

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: mapa.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapa.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.darkGray
        renderer.lineWidth = 2.0
        return renderer
    }
    
  
    
    @objc func action(gestureRecognizer: UIGestureRecognizer) {
    

        //self.mapa.removeAnnotations(mapa.annotations)
        //self.mapa.removeGestureRecognizer(gestureRecognizer)
        //self.mapa.removeOverlays()

        let touchPoint = gestureRecognizer.location(in: mapa)
        let newCoords = mapa.convert(touchPoint, toCoordinateFrom: mapa)
        
        geocoderLocation(newLocation: CLLocation(latitude: newCoords.latitude, longitude: newCoords.longitude))
        
        let latitud = String(format: "%.6f", newCoords.latitude)
        let longitud = String(format: "%.6f", newCoords.longitude)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoords
        annotation.title = adress
        annotation.subtitle = "Latitud: \(latitud) Longitud: \(longitud)"
        mapa.addAnnotation(annotation)
        
        let sourceCoodinate = locationManager.location?.coordinate
        let destCoordinate = CLLocationCoordinate2DMake(newCoords.latitude, newCoords.longitude)
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoodinate!)
        let destPlacemark = MKPlacemark(coordinate: destCoordinate)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destItem = MKMapItem(placemark: destPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response, error in
            guard let respone = response else{
                if let error = error{
                }
                return
            }
            let route = respone.routes[0]
           self.mapa.addOverlay(route.polyline, level: .aboveRoads)

            let rekt = route.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegion.init(rekt), animated: true)
        })
        
        
        
        
        
    }
    
    func geocoderLocation(newLocation: CLLocation) {
        var dir  = ""
        geocoder.reverseGeocodeLocation(newLocation) { (placemarks, error) in
            if error == nil {
                dir = "No se ha podido determinar la dirección"
            }
            if let placemark = placemarks?.last {
                dir = self.stringFromPlacemark(placemark: placemark)
            }
            self.adress = dir
        }

        
    }
    func stringFromPlacemark(placemark: CLPlacemark) -> String {
        var line = ""
        
        if let p = placemark.thoroughfare {
            line += p + ", "
        }
        if let p = placemark.subThoroughfare {
            line += p + " "
            print(line)
        }
        if let p = placemark.locality {
            line += " (" + p + ")"

        }
        if let p = placemark.postalCode{
            line += " (" + p + ")"
        }
        return line
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler( [ .alert, . sound])
    }


}
