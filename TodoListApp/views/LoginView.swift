//
//  LoginView.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Todo List", Subtitle: "Get things done", angle: 16, background:.blue )
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.vertical, 8)
                    }
                    
                    Button {
                        viewModel.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.pink)
                            
                            Text("Log In")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .padding(.top)
                    .frame(height: 50)
                }
                .scrollContentBackground(.hidden)
                
                // Sign Up Button
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                 destination: RegisterView())
                        .foregroundColor(.pink)
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
            .background(Color(.systemGray6))
        }
    }
}

#Preview {
    LoginView()
}
