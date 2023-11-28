//
//  CommunicatorApp.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI
import Firebase

@main
struct CommunicatorApp: App {
    
    // MARK: - Initializer
    init() {
        FirebaseApp.configure()
    }
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
