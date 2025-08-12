//
//  RegisterViewViewModel.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import Foundation
//import FirebaseAuth

class RegisterViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = ""
    
    func register() {
        // Clear old error
        errorMessage = ""
        print("Register app starts")
        
        // Run validation
        guard validateInputs() else { return }
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
//            if let error = error {
//                self?.errorMessage = "❌ \(error.localizedDescription)"
//                return
//            }
//            
//            // Success
//            print("✅ User registered: \(authResult?.user.uid ?? "Unknown UID")")
//        }
        print("📩 Email: \(email)")
        print("🔑 Password: \(password)")
        print("✅ Registration successful (simulated)")
}

private func validateInputs() -> Bool {
    if email.trimmingCharacters(in: .whitespaces).isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty {
        errorMessage = "Please fill in all fields."
        return false
    }
    
    if password != confirmPassword {
        errorMessage = "Passwords do not match."
        return false
    }
    
    if !email.contains("@") || !email.contains(".") {
        errorMessage = "Please enter a valid email address."
        return false
    }
    
    if password.count < 6 {
        errorMessage = "Password must be at least 6 characters long."
        return false
    }
    
    return true
}
}
