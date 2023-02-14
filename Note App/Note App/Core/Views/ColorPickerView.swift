//
//  ColorPickerView.swift
//  Note App
//
//  Created by Tomiwa Idowu on 05/02/2023.
//

import SwiftUI

struct ColorPickerView: View {
    var colors: [UIColor]
    
    @Binding var currrentIndex: Int
//    @Binding var selectedColor: Color
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(0..<colors.count) { index in
                    Circle()
                        .fill(currrentIndex == index ? .black : .white)
                        .frame(width: 55, height: 55)
                        .cornerRadius(55)
                        .overlay {
                            Circle()
                                .fill(Color.init(colors[index]))
                                .frame(width: 50, height: 50)
                        }
                        .onTapGesture {
                            currrentIndex = index
//                            selectedColor = colors[index]
                        }
                }
            }
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(
            colors: [.red, .green, .gray],
            currrentIndex: .constant(0)
//            selectedColor: .constant(.red)
        )
    }
}
