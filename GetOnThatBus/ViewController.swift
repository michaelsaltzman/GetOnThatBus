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
        
    }
    
    func populateMapWithAnnotations(array : NSArray) {
        for stop in array {
            let aStop = stop as! Stop
            mapViewThatWorks.addAnnotation(aStop)
        }
    }
}
    
