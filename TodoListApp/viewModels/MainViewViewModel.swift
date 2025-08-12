//
//  MainViewViewModel.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    
    init() {
        currentUserId = Auth.auth().currentUser?.uid ?? ""
    }
}
