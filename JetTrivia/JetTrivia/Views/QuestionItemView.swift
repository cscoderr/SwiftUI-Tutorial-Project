//
//  QuestionItemView.swift
//  JetTrivia
//
//  Created by Tomiwa Idowu on 1/5/24.
//

import SwiftUI

struct QuestionItemView: View {
    var question: Question
    @Binding var selectedAnswer: String?
    var onChange: (String) -> Void
    var body: some View {
        VStack {
            Text(question.question)
                .font(.title3)
                .padding()
            List(question.choices, id: \.self, selection: $selectedAnswer) { choice in
                Text(choice)
            }
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
            .shadow(radius: 2)
            .onChange(of: selectedAnswer ?? "") { _, newValue in
                onChange(newValue)
            }
            
        }
    }
}
