//
//  LoginView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    private let buttonWidth = UIScreen.main.bounds.width * 0.8
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack {
                self.linearGradient
                
                VStack {
                    self.appLogoView
                    
                    VStack(spacing: 20) {
                        self.emailField
                        self.passwordField
                        
                        HStack {
                            Spacer()
                            self.forgotPasswordButtonView
                        }
                        
                        self.signInButtonView
                        Spacer()
                        
                        NavigationLink {
                            RegistrationView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            self.signUpField
                        }
                        .padding(.bottom, 16)
                    }
                }
            }
        }
    }
    
    // MARK: - Views
    private var linearGradient: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [.cyan, .indigo, .indigo, .purple]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    private var appLogoView: some View {
        Text("Communicator")
            .font(.system(size: 36, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.top, 80)
    }
    
    private var emailField: some View {
        CustomTextField(
            text: $email,
            placeholder: Text("Email"),
            iconName: "envelope"
        )
        .padding()
        .background(Color(.init(white: 1, alpha: 0.15)))
        .cornerRadius(10.0)
        .foregroundColor(.white)
        .padding(.horizontal, 32)
    }
    
    private var passwordField: some View {
        CustomTextField(
            text: $password,
            placeholder: Text("Password"),
            iconName: "lock"
        )
        .padding()
        .background(Color(.init(white: 1, alpha: 0.15)))
        .cornerRadius(10.0)
        .foregroundColor(.white)
        .padding(.horizontal, 32)
    }
    
    private var forgotPasswordButtonView: some View {
        Button(action: {
            
        }, label: {
            Text("Forgot password?")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .padding(.top)
                .padding(.trailing, 32)
        })
    }
    
    private var signInButtonView: some View {
        Button(action: {
            self.viewModel.login(withEmail: self.email, password: self.password)
        }, label: {
            Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: self.buttonWidth, height: 50)
                .background(Color(.accent))
                .clipShape(Capsule())
                .padding()
        })
    }
    
    private var signUpField: some View {
        HStack {
            Text("Don't have an account?")
                .font(.system(size: 14))
            Text("Sign Up")
                .font(.system(size: 14, weight: .semibold))
        }
        .foregroundColor(.white)
    }
}

// MARK: - Preview
#Preview {
    LoginView()
}
