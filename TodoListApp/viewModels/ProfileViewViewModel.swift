//
//  ProfileViewViewModel.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage = ""
    
    init() {
        fetchUserData()
    }
    
    func fetchUserData() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let self = self,
                  let data = snapshot?.data(),
                  let id = data["id"] as? String,
                  let name = data["name"] as? String,
                  let email = data["email"] as? String,
                  let joined = data["joined"] as? TimeInterval else {
                return
            }
            
            DispatchQueue.main.async {
                self.user = User(id: id,
                               name: name,
                               email: email,
                               joined: joined)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            // SessionManager will handle the navigation
        } catch {
            print("❌ Error signing out: \(error.localizedDescription)")
            errorMessage = error.localizedDescription
        }
    }
}
