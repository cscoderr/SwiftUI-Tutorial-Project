//
//  DailyWeatherList.swift
//  weather-app-swiftUI
//
//  Created by Tomiwa Idowu on 05/12/2022.
//

import SwiftUI

struct DailyWeatherList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(1..<10, id: \.self) {_ in
                    DailyWeatherView()
                }
            }
            
        }
    }
}

struct DailyWeatherList_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherList()
            .previewLayout(.fixed(width: 500, height: 100))
    }
}
