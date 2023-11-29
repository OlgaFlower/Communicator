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
    
    let padding = LayoutConstants.paddingHorizont
    let btnWidth = LayoutConstants.onboardingBtnWidth
    let btnHeight = LayoutConstants.btnHeight
    let radius = LayoutConstants.btnCornerRadius
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack {
                    self.appLogoView
                    
                    VStack(spacing: 12.0) {
                        self.emailField
                            .padding(.horizontal, self.padding)
                        self.passwordField
                            .padding(.horizontal, self.padding)
                    }
                    
                    VStack(spacing: 4.0) {
                        self.signInButtonView
                        self.forgotPasswordButtonView
                    }
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        self.signUpField
                    }
                    .padding(.top, 44.0)
                }
            }
        }
    }
    
    // MARK: - Views
    private var appLogoView: some View {
        Text("Communicator")
            .font(
                .system(
                    size: 36,
                    weight: .bold,
                    design: .rounded
                )
            )
            .foregroundColor(.white)
            .padding(.top, 80.0)
            .padding(.bottom, 50)
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
        Button(
            action: {
                
            },
            label: {
                Text("Forgot password?")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
            }
        )
    }
    
    private var signInButtonView: some View {
        Button(
            action: {
                self.viewModel.login(
                    withEmail: self.email,
                    password: self.password
                )
            },
            label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(
                        width: self.btnWidth,
                        height: self.btnHeight
                    )
                    .overlay (
                        RoundedRectangle(cornerRadius: self.radius)
                            .stroke(CustomColor.blueWithOpacity, lineWidth: 1.0)
                    )
                    .padding()
            }
        )
    }
    
    private var signUpField: some View {
        HStack {
            Text("Don't have an account?")
                .font(.system(size: 14))
            Text("Sign Up")
                .font(.system(size: 14, weight: .semibold))
        }
        .padding(.bottom, 22.0)
        .foregroundColor(.white)
    }
}

// MARK: - Preview
#Preview {
    LoginView()
}
