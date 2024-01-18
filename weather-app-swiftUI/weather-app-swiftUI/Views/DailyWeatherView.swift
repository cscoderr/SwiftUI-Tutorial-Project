//
//  DailyWeatherView.swift
//  weather-app-swiftUI
//
//  Created by Tomiwa Idowu on 05/12/2022.
//

import SwiftUI

struct DailyWeatherView: View {
    var body: some View {
        VStack {
            Text("10 am")
            Image(systemName: "umbrella.fill")
                .renderingMode(.original)
            Text("Wind")
        }
        .padding(.all, 10)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10 ))
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView()
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
