//
//  ResultData.swift
//  weather-app
//
//  Created by Daniel on 17.02.2021.
//

import Foundation

struct ResultData: Codable {
    let info: Info
    let fact: Fact
}

struct Info: Codable {
    let tzinfo: Tzinfo
}

struct Tzinfo: Codable {
    let name: String
}

struct Fact: Codable {
    let temp: Int
    let condition: String
}
