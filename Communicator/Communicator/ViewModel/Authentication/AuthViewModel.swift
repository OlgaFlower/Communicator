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
    static let shared = AuthViewModel()
    @Published var userSession: FirebaseAuth.User?
    
    // MARK: - Initializator
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    // MARK: - Functions
    func login() {
    }
    
    func register(newUser: NewUserModel) {
        ImageUploader.uploadImage(image: newUser.image) { imageUrl in
            Auth.auth().createUser(withEmail: newUser.email, password: newUser.password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else { return }
                
                print("Successfully registered user...")
                
                let data = ["email" : newUser.email,
                            "userName" : newUser.userName,
                            "fullName" : newUser.fullName,
                            "prfileImageUrl" : imageUrl,
                            "uid" : user.uid]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data as [String : Any]) { error in
                    // TODO: - Handle error
                    
                    print("Successfully uploaded user data...")
                    self.userSession = user
                }
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
