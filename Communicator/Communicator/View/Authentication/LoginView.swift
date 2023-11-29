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
                BackgroundGradientView()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height)
                
                VStack {
                    self.appLogoView
                    
                    VStack(spacing: 20.0) {
                        self.emailField
                            .padding(.horizontal)
                        self.passwordField
                            .padding(.horizontal)
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
                                .padding(.bottom, 36.0)
                        }
                    }
                    .padding(.top, 28.0)
                }
            }
            
        }
    }
    
    // MARK: - Views
    private var appLogoView: some View {
        Text("Communicator")
            .font(.system(size: 36, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.top, 80.0)
    }
    
    private var emailField: some View {
        CustomTextField(
            text: $email,
            placeholder: "Email",
            iconName: "envelope"
        )
    }
    
    private var passwordField: some View {
        CustomTextField(
            text: $password,
            placeholder: "Password",
            iconName: "lock"
        )
    }
    
    private var forgotPasswordButtonView: some View {
        Button(action: {
            
        }, label: {
            Text("Forgot password?")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .padding(.top)
                .padding(.trailing, 32.0)
        })
    }
    
    private var signInButtonView: some View {
        Button(action: {
            self.viewModel.login(withEmail: self.email, password: self.password)
        }, label: {
            Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: self.buttonWidth, height: 50.0)
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
