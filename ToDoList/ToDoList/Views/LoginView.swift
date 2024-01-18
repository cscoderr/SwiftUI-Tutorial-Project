//
//  LoginView.swift
//  ToDoList
//
//  Created by Tomiwa Idowu on 12/16/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(
                    title: "To Do List", 
                    subTitle: "Get Things done",
                    angle: 15, 
                    backgroundColor: .pink
                )
                
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", backgroundColor: .pink){
                        
                    }
                }
                .offset(y: -50)
                

                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    LoginView()
}
