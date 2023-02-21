//
//  ResultView.swift
//  BMI Calculator SwiftUI
//
//  Created by Tomiwa Idowu on 21/02/2023.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Result")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("AppBackground"))
                .frame( height: 200)
                .overlay {
                    VStack(alignment: .center) {
                        Text("AGE")
                            .font(.system(size: 20, weight: .light))
                            .foregroundColor(.white.opacity(0.5))
                        Text("25")
                            .font(.system(size: 50, weight: .heavy))
                            .foregroundColor(.white)
                        HStack(spacing: 20) {
                            Circle()
                                .fill(.gray)
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "minus")
                                        .resizable()
                                        .frame(height: 5)
                                        .padding()
                                        .foregroundColor(.white)
                            }
                            Circle()
                                .fill(.gray)
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .padding()
                                        .foregroundColor(.white)
                            }
                        }
                    }
                }
            Spacer()
        }
        .padding([.horizontal], 20)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
