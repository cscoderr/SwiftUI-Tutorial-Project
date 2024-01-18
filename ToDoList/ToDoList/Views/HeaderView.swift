//
//  HeaderView.swift
//  ToDoList
//
//  Created by Tomiwa Idowu on 12/16/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(.degrees(angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 55)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(
        title: "Title", subTitle: "Subtitle", angle: 15, backgroundColor: .blue
    )
}
