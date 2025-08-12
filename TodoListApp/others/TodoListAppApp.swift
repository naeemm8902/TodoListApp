import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

@main
struct TodoListAppApp: App {
    init() {
        print("🔥 Configuring Firebase...")
        FirebaseApp.configure()
        print("✅ Firebase configured successfully")
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
