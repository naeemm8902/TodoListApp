//
//  ContentView.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @StateObject private var viewModel = MainViewViewModel()
    @StateObject private var sessionManager = SessionManager.shared
    
    var body: some View {
        TabView {
            TodoListView()
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Sign Out") {
                    sessionManager.signOut()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
