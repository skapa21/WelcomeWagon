//
//  ViewController.swift
//  WelcomeWagon
//
//  Created by Smaran Kapa 2021 on 5/13/19.
//  Copyright © 2019 Smaran Kapa 2021. All rights reserved.
// created by Smaran, Rak, James, Zach, Shrujan

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {
    
    var currentLocation: CLLocation!
    var pizzaPlace: [MKMapItem] = []
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        locationManager.requestWhenInUseAuthorization()
        print(mapView.showsUserLocation)
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[0]
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let pin = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        pin.image = UIImage(named: "Wagon")
        pin.canShowCallout = true
        let button  = UIButton(type: .detailDisclosure)
        pin.rightCalloutAccessoryView = button
        return pin
    }

}

