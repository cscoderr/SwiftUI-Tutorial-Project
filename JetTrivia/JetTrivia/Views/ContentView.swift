//
//  ContentView.swift
//  JetTrivia
//
//  Created by Tomiwa Idowu on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var questionViewModel = QuestionViewModel()
    @State private var questions: [Question] = []
    @State private var selectedAnswer: String?
    @State private var isCorrect: Bool = false
    @State private var selectedTab: Int = 0
    @State private var isCorrectAnimating: Bool = false
    @State private var isInCorrectAnimating: Bool = false
    
    var body: some View {
        
        NavigationView {
            switch(questionViewModel.status) {
            case .loading, .initial:
                VStack {
                    ProgressView()
                        .padding(.bottom, 10)
                    Text("Loading...")
                }
            case .success(let questions):
                if(questions.isEmpty) {
                    VStack(alignment: .center) {
                        Image(systemName: "lightbulb.slash")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 20)
                        Text("No Question Available")
                            .font(.subheadline)
                            .padding(.bottom, 20)
                    }
                    .padding()
                } else {
                    VStack {
                        
                        TabView(selection: $selectedTab) {
                            ForEach(0..<questions.count, id: \.self) { index in
                                QuestionItemView(question: questions[index], selectedAnswer: $selectedAnswer)
                                    { value in
                                        isCorrect = value == questions[index].answer
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                            selectedTab += 1
                                            selectedAnswer = nil
                                        }
                                    }
                                    .tag(index)
                                
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .background(.background)
                        .padding(.top, 50)
                        
                        if(selectedAnswer != nil) {
                            if(isCorrect) {
                                
                                HStack {
                                    Text("Correct")
                                        .padding()
                                        .foregroundColor(.white)
                                        
                                }
                                .background(.green)
                                .cornerRadius(10)
                                .offset(y: isCorrectAnimating ? -20 : 20)
                                .onAppear {
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        isCorrectAnimating.toggle()
                                    }
                                }
                            } else {
                                Text("Not Correct")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.red)
                                    .cornerRadius(10)
                                    .offset(x: isCorrectAnimating ? -10 : 20)
                                    .onAppear {
                                        withAnimation(.easeOut(duration: 0.3)) {
                                            isCorrectAnimating.toggle()
                                        }
                                    }
                            }
                        }
                        
                        HStack {
                            Button {
                                selectedTab -= 1
                            } label: {
                                Text("Prev")
                            }
                            .disabled(selectedTab == 0)
                            Spacer()
                            Button {
                                 selectedTab += 1
                            } label: {
                                Text("Next")
                            }
                            .disabled(selectedTab == (questions.count-1))
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 20)
                    }
                    .navigationTitle("Quiz")
                    .toolbar(content: {
                        Text("\(selectedTab+1)/\(questions.count)")
                    })
                }
            case .failure(let error):
                VStack(alignment: .center) {
                    Image(systemName: "lightbulb.slash")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 20)
                    Text("\(error)")
                        .font(.subheadline)
                        .padding(.bottom, 20)
                }
            }
        }
        .task {
            await questionViewModel.getAllQuestions()
        }
        
    }
}

#Preview {
    ContentView()
}
