import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        print("📩 Email: \(email)")
        print("🔑 Password: \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("❌ Registration error: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
                return
            }
            
            guard let userId = result?.user.uid else {
                print("❌ Failed to get user ID")
                self.errorMessage = "Failed to get user ID"
                return
            }
            
            print("✅ User created with ID: \(userId)")
            self.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                          name: name,
                          email: email,
                          joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) { error in
                if let error = error {
                    print("❌ Error saving user data: \(error.localizedDescription)")
                } else {
                    print("✅ User data saved successfully")
                }
            }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            print("❌ Validation failed: Empty fields")
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            print("❌ Validation failed: Invalid email format")
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters"
            print("❌ Validation failed: Password too short")
            return false
        }
        
        return true
    }
}
