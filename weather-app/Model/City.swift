//
//  City.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import Foundation

struct City {
    var name: String
    var lat: Double
    var lon: Double
    var info: String
    
    init(name: String, lat: Double, lon: Double, info: String) {
        self.name = name
        self.lat = lat
        self.lon = lon
        self.info = info
    }
}
