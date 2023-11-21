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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
        }
    }
}
