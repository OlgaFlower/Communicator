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
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    // MARK: - Initializator
    private init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    // MARK: - Functions
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                // TODO: - Handle error
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(newUser: NewUserModel) {
        
        ImageUploader.uploadImage(image: newUser.image) { imageUrl in
            Auth.auth().createUser(withEmail: newUser.email, password: newUser.password) { result, error in
                if let error = error {
                    // TODO: - Handle error
                    print("DEBUG: User registering failed \(error.localizedDescription)")
                    return
                }
                guard let user = result?.user else { return }
                
                print("Successfully registered user...")
                
                let data = ["email" : newUser.email,
                            "userName" : newUser.userName,
                            "fullName" : newUser.fullName,
                            "profileImageUrl" : imageUrl,
                            "uid" : user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data as [String : Any]) { error in
                    // TODO: - Handle error
                    
                    print("Successfully uploaded user data...")
                    self.userSession = user
                    self.fetchUser()
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
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            
            if let error = error {
                // TODO: - Handle error
                print("DEBUG: User fetching failed \(error.localizedDescription)")
                return
            }
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            print(user)
        }
    }
}
