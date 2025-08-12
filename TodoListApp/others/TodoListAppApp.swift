import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

@main
struct TodoListAppApp: App {
    @StateObject private var sessionManager = SessionManager.shared
    
    init() {
        print("🔥 Configuring Firebase...")
        FirebaseApp.configure()
        print("✅ Firebase configured successfully")
    }
    
    var body: some Scene {
        WindowGroup {
            if sessionManager.isAuthenticated {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}
