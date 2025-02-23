//
//  LoadingView.swift
//  Weather
//
//  Created by Dwistari on 26/11/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color.gray.opacity(0.5))
    }
}

#Preview {
    LoadingView()
}
