//
//  ViewController.swift
//  Map App
//
//  Created by Gudla Srinivas on 10/19/14.
//  Copyright (c) 2014 sgudla. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // latitude
        //37.253022, -121.934048

        var latitude:CLLocationDegrees = 37.253022
        var longitude:CLLocationDegrees = -121.934048
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)

        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
       
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
       
        mapView.setRegion(region, animated: true)
        
        var annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Xilinx Inc."
        annotation.subtitle = "My Office"
        
        mapView.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

