//
//  Extentions.swift
//  Weather
//
//  Created by Dwistari on 29/11/24.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
    
    func convertCelcious() -> String {
        let celcius = self - 273.15
        return celcius.roundDouble()
    }
}



extension String {
    var convertDate : String? {
        let inputFormatter = DateFormatter()
        var dateString = ""
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            dateString = outputFormatter.string(from: date)
        } else {
            print("Format tanggal tidak valid")
        }
        
        return dateString
    }
}


