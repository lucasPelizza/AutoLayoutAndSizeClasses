//
//  ConstraintsAndSizeClassesViewController.swift
//  AutoLayoutAndSizeClasses
//
//  Created by Lucas Pelizza on 9/6/17.
//  Copyright © 2017 Lucas Pelizza. All rights reserved.
//

import UIKit
import MapKit

class ConstraintsAndSizeClassesViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -50.216667, longitude: -72.416667),
                                        span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
        mapView.setRegion(region, animated: true)
        mapView.mapType = .hybrid
    }
}

