//
//  WeatherItemView.swift
//  Weather
//
//  Created by Dwistari on 29/11/24.
//

import SwiftUI

struct WeatherItemView: View {
    var forecast: Forecast
    var weather: String {
        guard let forecastName = forecast.weather.first?.main else { return "kosong" }
        switch forecastName {
        case "Rain":
            return "day-rain"
        case "Clouds":
            return "day-cloudy"
        case "Wind":
            return "day-wind"
        case "Clear":
            return "day-sun"
        default:
            return "day-sun"
        }
    }
    
    var body: some View {
        VStack {
            Text(forecast.dtTxt.convertDate ?? "")
            Image(weather)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            Text("\(forecast.main.temp.convertCelcious())°")
        }
        .foregroundColor(.white)
        .background(.clear)
        
    }
}
