//
//  HomeCardView.swift
//  SwiftUI-ToDo
//
//  Created by Tomiwa Idowu on 1/14/24.
//

import SwiftUI

struct HomeCardView: View {
    var text: String
    var image: String
    var iconBackgroudColor: Color
    var count: Int
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Image(systemName: image)
                    .padding(.all, 8)
                    .background(iconBackgroudColor)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                    
                    
                Text(text)
                    
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(String(count))
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
        .background(.cardBg)
        .cornerRadius(20)
    }
}

#Preview {
    HStack {
        HomeCardView(text: "Today", image: "calendar", iconBackgroudColor: .red, count: 10)
        HomeCardView(text: "Scheduled", image: "calendar", iconBackgroudColor: .red, count: 10)
    }
}
