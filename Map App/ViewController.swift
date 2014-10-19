//
//  ViewController.swift
//  Map App
//
//  Created by Gudla Srinivas on 10/19/14.
//  Copyright (c) 2014 sgudla. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

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
        
        var gesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "action:");
        gesture.minimumPressDuration = 2.0
        
        mapView.addGestureRecognizer(gesture)
    }
    
    //Called everytime location is updated
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("Locations = \(locations)")
    }
    
    //Called when location is not obtained coz user has declined to give access or some other error.
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    func action(gesture: UILongPressGestureRecognizer) {
        var touchPoint = gesture.locationInView(self.mapView)
        var location:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        var newAnnot:MKPointAnnotation = MKPointAnnotation()
        newAnnot.coordinate = location
        newAnnot.title = "My New annotation"
        newAnnot.subtitle = "My New annotation sub title"
        self.mapView.addAnnotation(newAnnot)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

