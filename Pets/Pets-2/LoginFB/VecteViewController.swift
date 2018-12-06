//
//  VecteViewController.swift
//  LoginFB
//
//  Created by macbook  on 12/5/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VecteViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    var desecodview : String = ""
    var latitud1 = Double()
    var longitud1 = Double()
    var locationManager = CLLocationManager()
    
  
    @IBOutlet weak var Veterinaria: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Veterinaria.text = desecodview

        mapa.delegate = self
        mapa.showsScale = true
        mapa.showsPointsOfInterest = true
        mapa.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        let sourceCoodinate = locationManager.location?.coordinate
        let destCoordinate = CLLocationCoordinate2D(latitude: latitud1, longitude: longitud1)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoodinate!)
        let destPlacemark = MKPlacemark(coordinate: destCoordinate)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destItem = MKMapItem(placemark: destPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .automobile
        
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
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitud1, longitude: longitud1)
        annotation.title = desecodview
       // annotation.subtitle = "Latitud: \(latitud) Longitud: \(longitud)"
        mapa.addAnnotation(annotation)

    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.darkGray
        renderer.lineWidth = 2.0
        return renderer
    }
    

    

}
