//
//  TLButton.swift
//  ToDoList
//
//  Created by Tomiwa Idowu on 12/16/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(
        title: "Value", backgroundColor: .pink) {
            
        }
}
