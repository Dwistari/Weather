//
//  ContentView.swift
//  Weather
//
//  Created by Dwistari on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : WeatherResponse?
    @State var forecast : ForecastResponse?

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather, let forecast = forecast {
                    WeatherView(weather: weather, forecast: forecast)
                }
                else{
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                                
                                forecast = try await weatherManager.getForecast(latitude: location.latitude, longtitude: location.longitude)
                                
                                print("weather", weather ?? "kosong")
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if !locationManager.isLoading {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
