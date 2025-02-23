//
//  WelcomeView.swift
//  Weather
//
//  Created by Dwistari on 26/11/24.
//

import SwiftUI
import CoreLocationUI
import LoadingButton

struct WelcomeView: View {
    @State var isLoading: Bool = false
    @EnvironmentObject var locationManager: LocationManager
    @State var sizeOfImage: CGFloat = UIScreen.main.bounds.height/2

    var body: some View {
        ZStack {
            Image("day-cloudy")
                .resizable()
                .scaledToFill()
                .padding()
                .frame(width: 300, height: 300)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
            
            VStack{
                Text("Welcome to Weather App")
                    .bold().font(.title)
                Text("Discover the weather in your city and plan your day corectly")
                    .padding()
                
                LoadingButton(action: {
                    locationManager.requestLocation()
                }, isLoading: $isLoading, style: LoadingButtonStyle(width: 80, height: 80, cornerRadius: 80, backgroundColor: .blue, strokeColor: .white)) {
                    ZStack {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                }
            }
            .multilineTextAlignment(.center)
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.5))
    }
}

#Preview {
    WelcomeView()
}
