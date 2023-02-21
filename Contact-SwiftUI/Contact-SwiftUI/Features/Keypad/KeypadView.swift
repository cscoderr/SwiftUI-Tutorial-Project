//
//  KeypadView.swift
//  Contact-SwiftUI
//
//  Created by Tomiwa Idowu on 15/02/2023.
//

import SwiftUI

struct KeypadView: View {
    @State private var keys: String = ""
    var column: [GridItem] {
        [GridItem](repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 3)
    }
    var body: some View {
        VStack {
            Spacer()
            Text("\(keys)")
            LazyVGrid(columns: column, spacing: 30) {
                ForEach(1...12, id: \.self) { value in
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Text("\(value)")
                                .foregroundColor(.black)
                            if value != 1 {
                                Text("ABC")
                            }
                        }
                        .padding()
                    }
                    .background(Circle()
                        .fill(.black.opacity(0.3))
                        .frame(width: 70, height: 70))
                    .onTapGesture {
                        print(value)
                        keys = "\(value)"
                    }
                        
                }
            }
            .padding([.horizontal], 40)
            Spacer()
        }
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        KeypadView()
    }
}
