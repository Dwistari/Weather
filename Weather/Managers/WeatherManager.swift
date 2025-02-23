//
//  WeatherManager.swift
//  Weather
//
//  Created by Dwistari on 27/11/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    let API_KEY = "c931212336ae67becb63b6ba5714fba1"
    
    
    func getCurrentWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws -> WeatherResponse {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&appid=\(API_KEY)") else {fatalError("Fatal error")}
        
        
        let urlRequest = URLRequest(url: url)
        
        print("API->>",urlRequest)
        
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode ==  200 else {fatalError("Fatal error\(response)")}
        
        
        let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return decodedData
        
    }
    
    func getForecast(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws -> ForecastResponse {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longtitude)&appid=\(API_KEY)") else {fatalError("Fatal error")}
        
        let urlRequest = URLRequest(url: url)
        
        print("API->>",urlRequest)

        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode ==  200 else {fatalError("Fatal error\(response)")}
        let decodedData = try JSONDecoder().decode(ForecastResponse.self, from: data)
        return decodedData
    }
}
