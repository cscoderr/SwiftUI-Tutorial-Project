//
//  RegisterView.swift
//  ToDoList
//
//  Created by Tomiwa Idowu on 12/16/23.
//

import SwiftUI

struct RegisterView: View {
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subTitle: "Start organizing todo",
                angle: -15,
                backgroundColor: .orange
            )
            
            
            Form {
                TextField("Your name", text: $fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Your Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Create Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", backgroundColor: .green){
                    
                }
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
