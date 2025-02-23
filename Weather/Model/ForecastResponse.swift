//
//  ForecastResponse.swift
//  Weather
//
//  Created by Dwistari on 23/02/25.
//

import Foundation

struct ForecastResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast]
    let city: City
}

struct Forecast: Codable {
    let id = UUID()
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: ForecastSys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}


struct Rain: Codable {
    let threeHour: Double?

    enum CodingKeys: String, CodingKey {
        case threeHour = "3h"
    }
}


struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}

struct ForecastSys: Codable {
    let pod: String
}

