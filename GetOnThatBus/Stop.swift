//
//  Stop.swift
//  GetOnThatBus
//
//  Created by Andrew Miller on 2/2/16.
//  Copyright © 2016 Michael Saltzman. All rights reserved.
//

import Foundation
import MapKit

class Stop: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var latitude: Double
    var longitude: Double
    
    init (name:String, longitude:Double, latitude:Double, info:String) {
        self.title = name
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.info = info
        self.latitude = latitude
        self.longitude = longitude
    }
}