//
//  HomeView.swift
//  weather-app-swiftUI
//
//  Created by Tomiwa Idowu on 05/12/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Tomiwa")
                        .font(.title)
                    Text("12 September, Sunday")
                }
                Spacer()
                Image(systemName: "square.grid.2x2.fill")
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("18°")
                        .font(.system(size: 60, weight: .heavy))

                    Text("Thunderstorm")
                }
                Spacer()
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .font(.system(size: 60))

            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            HStack {
                VStack {
                    Image(systemName: "suit.club.fill")
                        .renderingMode(.original)
                    Text("Wind")
                }
                Spacer()
                VStack {
                    Image(systemName: "cloud.rain.fill")
                        .renderingMode(.original)
                    Text("Humidity")
                }
                Spacer()
                VStack {
                    Image(systemName: "umbrella.fill")
                        .renderingMode(.original)
                    Text("Wind")
                }
            }
            .padding(.all, 30)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10 ))
           
            DailyWeatherList()
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
