//
//  HomeView.swift
//  BMI Calculator SwiftUI
//
//  Created by Tomiwa Idowu on 14/02/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var sliderValue = 0.5
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AppBackgroundActive"))
                        .frame(height: 200)
                        .overlay {
                            VStack(alignment: .center) {
                                Image("mars")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                Text("MALE")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AppBackgroundActive").opacity(0.8))
                        .frame( height: 200)
                        .overlay {
                            VStack(alignment: .center) {
                                Image("venus")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                Text("FEMALE")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }
                }
                .padding(.bottom, 20)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AppBackground"))
                    .frame( height: 200)
                    .overlay {
                        VStack(alignment: .center) {
                            Text("HEIGHT")
                                .font(.system(size: 20, weight: .light))
                                .foregroundColor(.white.opacity(0.5))
                            HStack(alignment: .bottom) {
                                Text("181")
                                    .font(.system(size: 50, weight: .heavy))
                                    .foregroundColor(.white)
                                Text("CM")
                                    .font(.system(size: 20, weight: .heavy))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                    .padding(.leading, -10)
                            }
                            Slider(value: $sliderValue) { value in
                                
                            }
                            .padding(.horizontal, 20)
                            
                        }
                    }
                    
                    .padding(.bottom, 20)
                
                HStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AppBackground"))
                        .frame( height: 200)
                        .overlay {
                            VStack(alignment: .center) {
                                Text("WEIGHT")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                                Text("60")
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
                }
                .padding(.bottom, 20)
                Spacer()
                Button {
                    
                } label: {
                    Text("CALCULATE YOUR BMI")
                        .foregroundColor(.white)
                        
                }
                .padding()
                .buttonStyle(.plain)
                .frame(width: UIScreen.main.bounds.width)
                .background(
                    Rectangle()
                        .fill(.red)
                        
                )
            }
            .padding([.horizontal, .vertical], 20)
            .navigationTitle("BMI Calculator")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
