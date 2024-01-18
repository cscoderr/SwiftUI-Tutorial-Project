//
//  QuestionViewModel.swift
//  JetTrivia
//
//  Created by Tomiwa Idowu on 1/5/24.
//

import Foundation

enum QuestionStatus {
    case initial
    case loading
    case success(questions: [Question])
    case failure(error: String)
}

class QuestionViewModel: ObservableObject {
    @Published private(set) var status: QuestionStatus = QuestionStatus.initial
    
    @MainActor
    func getAllQuestions() async {
        status = QuestionStatus.loading
        do {
            let url = "\(Constants.baseUrl)/world.json"
            let response = try await ApiService().getRequest(string: url) as [Question]
            status = QuestionStatus.success(questions: response)
        } catch ApiServiceError.invalidURL {
            status = QuestionStatus.failure(error: "Invalid Url")
        } catch ApiServiceError.invalidResponse {
            status = QuestionStatus.failure(error: "Invalid Response")
        } catch ApiServiceError.invalidData {
            status = QuestionStatus.failure(error: "Invalid Data")
        } catch {
            status = QuestionStatus.failure(error: error.localizedDescription)
        }

    }
}
