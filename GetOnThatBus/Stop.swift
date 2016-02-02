//
//  Stop.swift
//  GetOnThatBus
//
//  Created by Andrew Miller on 2/2/16.
//  Copyright © 2016 Michael Saltzman. All rights reserved.
//

import Foundation

class Stop{
    let name: String
    let longitude: Double
    let latitude: Double
    
    init (name:String, longitude:Double, latitude:Double) {
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
    }
}