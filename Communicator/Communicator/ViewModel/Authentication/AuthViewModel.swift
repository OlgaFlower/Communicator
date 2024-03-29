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
    @Published var didSendResetPasswordLink = false
    
    @Published var loginCredentialsValid = true
    @Published var isEmailValid = true
    @Published var isPasswordValid = true
    @Published var isUsernameValid = true
    @Published var isFullnameValid = true
    @Published var isRegistrationSuccessful = true
    
    var userNamesValid: Bool {
        return self.isUsernameValid && self.isFullnameValid
    }
    
    var emailAndPasswordValid: Bool {
        return self.isEmailValid && self.isPasswordValid
    }
    
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
                
                self.loginCredentialsValid = false
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(newUser: NewUserModel) {
        
        ImageUploader.uploadImage(image: newUser.image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: newUser.email, password: newUser.password) { result, error in
                
                if let error = error {
                    // TODO: - Handle error
                    print("DEBUG: User registering failed \(error.localizedDescription)")
                    
                    self.isRegistrationSuccessful = false
                    return
                }
                
                guard let user = result?.user else { return }
                
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
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            
            if let error = error {
                print("Failed to send link with error \(error.localizedDescription)")
                return
            }
            self.didSendResetPasswordLink = true
        }
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
    
    func validateEmailAndPassword(
        _ email: String,
        _ password: String
    ) {
        self.isEmailValid = self.validateEmail(email)
        self.isPasswordValid = self.validatePassword(password)
    }
    
    func validateUserNameAndFullName(
        _ username: String,
        _ fullname: String
    ) {
        self.isUsernameValid = self.validateUsername(username)
        self.isFullnameValid = self.validateFullName(fullname)
    }
}

// MARK: - Validation
extension AuthViewModel {
    
    private func validateUsername(_ username: String) -> Bool {
        let usernameRegex = "^[a-zA-Z0-9_]{5,30}$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return usernamePredicate.evaluate(with: username)
    }
    
    private func validateFullName(_ name: String) -> Bool {
            let nameRegex = "^[a-zA-Z0-9\\s]{3,30}$"
            let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
            return namePredicate.evaluate(with: name)
        }
    
    private func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}
