//
//  ContentView.swift
//  Animated-Card-SwiftUI
//
//  Created by Tomiwa Idowu on 30/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var scale: Double = 1
    @State private var isActive: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 70, height: 70)
                        .scaleEffect(scale)
                        .onTapGesture {
                            if(isActive) {
                                scale = 11
                            } else {
                                scale = 1
                            }
                            isActive.toggle()
                        }
                        .animation(Animation.easeInOut(duration: 0.5), value: scale)
                    )
                .padding()
                .padding(.bottom, 20)
                
            
            Text("Perfect for learning how SWIFTUI works, prototyping a new idea, or creating a demo to share online")
                .padding(.bottom, 20)
            
            Text("Learn More")
                .font(.system(size: 20, weight: .bold))

            
        }
        .padding()
        .background(
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(20)
        )
        .clipped()
        .cornerRadius(20)
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
