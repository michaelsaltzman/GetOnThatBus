//
//  MapModel.swift
//  GetOnThatBus
//
//  Created by Andrew Miller on 2/2/16.
//  Copyright © 2016 Michael Saltzman. All rights reserved.
//

import Foundation

class MapModel {
        
    let urlString = "https://s3.amazonaws.com/mmios8week/bus.json"
    
    func loadStops () -> [Stop] {
    
    var stops = [Stop]()
    let jsonDictionary = fetchJSON(urlString)
    let stopsFromJSON = jsonDictionary!["row"] as! [NSDictionary]
        
        for stop in stopsFromJSON {
            let name = stop["cta_stop_name"] as! String
            let latitude = stop["latitude"] as! String
            let longitude = stop["longitude"] as! String
            let stop = Stop(name: name, longitude: Double(latitude)!, latitude: Double(longitude)!)
            
            stops.append(stop)
        }
        
    return stops
    }
//    var meetUps = [MeetUp]()
//    
//    for event in results {
//        let eventName = event["name"] as! String
//        let eventAddress: String
//        if let venue = event["venue"] {
//            eventAddress = venue["address_1"] as! String
//        } else {
//            eventAddress = "No address"
//        }
    
    
    
    // load json data
    private func fetchJSON(urlString: String) -> NSDictionary? {
        guard let jsonData = getJSON(urlString), let jsonDictionary = parseJSON(jsonData) else {
            return nil
        }
        return jsonDictionary
    }
    
    private func getJSON(urlToRequest: String) -> NSData? {
        guard let url = NSURL(string: urlToRequest), let json = NSData(contentsOfURL: url) else {
            return nil
        }
        
        return json
    }
    
    private func parseJSON(inputData: NSData) -> NSDictionary? {
        var dictionary: NSDictionary
        do {
            try dictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: .MutableContainers) as! NSDictionary
        } catch {
            print("it crashed")
            return nil
        }
        
        return dictionary
    }
}
