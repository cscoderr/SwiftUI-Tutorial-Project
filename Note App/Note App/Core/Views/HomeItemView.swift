//
//  HomeItemView.swift
//  Note App
//
//  Created by Tomiwa Idowu on 30/01/2023.
//

import SwiftUI

struct HomeItemView: View {
    var title: String
    var description: String
    var color: UIColor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            Text(description)
                .font(.system(size: 16))
                .padding(.bottom, 10)
        }
        .padding()
        .background(
            Rectangle()
                .foregroundColor(Color.init(color))
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width/2.5)
        )
        
    }
}
    
struct HomeItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeItemView(
            title: "Coffee", description: "Prepare hot coffee for friends",
            color: UIColor.gray
        )
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
