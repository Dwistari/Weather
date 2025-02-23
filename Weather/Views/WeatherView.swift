//
//  WeatherView.swift
//  Weather
//
//  Created by Dwistari on 28/11/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: WeatherResponse
    var forecast: ForecastResponse

    let weatherItems = [1, 2, 3, 4, 5]
    var status: String {
        if ((weather.weather.first?.main.contains("Cloudy")) != nil) {
            return "day-cloudy"
        } else {
            return "day-sun"
        }
        
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        Text(weather.name)
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .bold()
                            .padding(.top, 8)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Image(status)
                            .resizable()
                            .scaledToFill()
                            .padding()
                            .frame(width: 300, height: 300)
                        
                        Text("\(weather.main.temp.convertCelcious())°")
                            .font(.largeTitle)
                            .bold()
                        
                        Text(weather.name)
                            .font(.callout)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                    
                    HStack {
                        VStack {
                            Text("Visibility")
                                .font(.footnote)
                            Text("\(weather.visibility)m")
                                .font(.callout)
                                .bold()
                                .padding(.top, 5)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        
                        Rectangle()
                            .frame(width: 1)
                            .background(Color.white)
                            .padding([.top, .bottom], 16)
                        
                        VStack {
                            Text("Wind")
                                .font(.footnote)
                            
                            Text("\(weather.wind.speed.roundDouble())m/s")
                                .font(.title3)
                                .bold()
                                .padding(.top, 5)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        
                        Rectangle()
                            .frame(width: 1)
                            .background(Color.white)
                            .padding([.top, .bottom], 16)
                        
                        VStack {
                            Text("Humidity")
                                .font(.footnote)
                            Text("\(weather.main.humidity)°")
                                .font(.title3)
                                .bold()
                                .padding(.top, 5)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                    }
                    
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .foregroundColor(.clear)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .padding()
                    
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(forecast.list, id: \.id) { forecast in
                                    WeatherItemView(forecast: forecast)
                                        .padding()
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .listRowBackground(Color.blue)
                        }
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .padding()
                }
                
            }
            
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color(hue: 0.604, saturation: 0.365, brightness: 0.476))
        }
    }
    
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
    
    func filterForecast(forecasts: [Forecast], currentDate: String)-> [Forecast] {
        // Flatten the 2D array into a 1D array and apply filtering logic
        return forecasts.filter { forecast in
            // You can add additional filtering logic based on currentDate
            return forecast.dtTxt.contains(currentDate)
        }
    }
}


