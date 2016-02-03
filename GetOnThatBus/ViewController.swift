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
        let stopsArray = mapModel.loadStops()
        populateMapWithAnnotations(stopsArray)
        setRegion(stopsArray)
        
    }
    
    func populateMapWithAnnotations(stopsArray : NSArray) {
        for stop in stopsArray {
            let aStop = stop as! Stop
            mapViewThatWorks.addAnnotation(aStop)
        }
    }
    
    
    func setRegion (stopsArray: [Stop]) -> () {
//        let averageLatitude = (stopsArray.reduce(0) {$0 + $1.latitude}) / Double(stopsArray.count)
//        let averageLongitude = (stopsArray.reduce(0) {$0 + $1.longitude}) / Double(stopsArray.count)

        let centerCoordiante = CLLocationCoordinate2DMake(stopsArray[0].latitude, stopsArray[0].longitude)
        let span = MKCoordinateSpanMake(1, 1)
        self.mapViewThatWorks.setRegion(MKCoordinateRegion(center: centerCoordiante, span: span), animated: true)
    }
}
    
