//
//  RegisterView.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import SwiftUI
struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel() // ✅ here

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Register Page",
                           Subtitle: "Get things done",
                           angle: 16,
                           background: .green)

                // Login Form
                Form {
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()

                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()

                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.vertical, 8)
                    }

                    Button {
                        viewModel.register()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.pink)

                            Text("Register")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .padding(.top)
                    .frame(height: 50)
                }
                .scrollContentBackground(.hidden)

                Spacer()
            }
            .background(Color(.systemGray6))
        }
    }
}

#Preview {
    RegisterView()
}
