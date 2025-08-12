//
//  LoginViewViewModel.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import Foundation
//import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
//            if let error = error {
//                self?.errorMessage = error.localizedDescription
//                print("❌ Login error: \(error.localizedDescription)")
//                return
//            }
//            
//            print("✅ Login successful")
//        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            print("❌ Error: Empty fields")
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            print("❌ Error: Invalid email format")
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long"
            print("❌ Error: Password too short")
            return false
        }
        
        return true
    }
}
