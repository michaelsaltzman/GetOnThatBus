//
//  ViewController.swift
//  GetOnThatBus
//
//  Created by Michael Saltzman on 2/2/16.
//  Copyright © 2016 Michael Saltzman. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapViewThatWorks: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapViewThatWorks.delegate = self
        
        let mapModel = MapModel()
        let array = mapModel.loadStops()
        populateMapWithAnnotations(array)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(-85,41)
        annotation.title = "Same"
        print(annotation.coordinate)
        mapViewThatWorks.addAnnotation(annotation)

        
        
    }
    
    func populateMapWithAnnotations(array : NSArray) {
        for stop in array {
            let newStop = stop as! Stop
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(newStop.latitude, newStop.longitude)
            annotation.title = newStop.name
            print(annotation.coordinate)
            mapViewThatWorks.addAnnotation(annotation)
            
            
        }
    }
}
    
