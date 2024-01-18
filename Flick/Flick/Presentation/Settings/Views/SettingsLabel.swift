//
//  SettingsLabel.swift
//  Flick
//
//  Created by Tomiwa Idowu on 1/7/24.
//

import SwiftUI

struct SettingsLabel: View {
    var imageName: String
    var text: String
    var backgroundColor: Color
    var hasTrailingIcon: Bool = true
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(backgroundColor)
                Image(systemName: imageName)
                    .foregroundColor(.white)
            }
            .frame(width: 30, height: 30, alignment: .center)
            .padding(.trailing, 8)
            
            Text(text)
            Spacer()
            if(hasTrailingIcon) {
                Image(systemName: "chevron.right")
            }
        }
    }
}

#Preview {
    SettingsLabel(
        imageName: "info.circle", text: "Home", backgroundColor: .blue)
}
