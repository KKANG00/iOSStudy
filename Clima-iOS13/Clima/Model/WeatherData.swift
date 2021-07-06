//
//  WeatherData.swift
//  Clima
//
//  Created by KKANG on 2021/07/05.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [WeatherItem]
}

struct Main: Codable {
    let temp: Double
}

struct WeatherItem: Codable{
    let description: String
    let id: Int
}
