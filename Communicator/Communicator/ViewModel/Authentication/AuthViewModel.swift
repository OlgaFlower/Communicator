//
//  AuthViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 21.11.23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    
    // MARK: - Initializator
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    // MARK: - Functions
    func login() {
    }
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user...")
        }
    }
    
    func signOut() {
        
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
