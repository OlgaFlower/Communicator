//
//  LoginView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showLoginForm = false
    @State private var logoPosition: CGFloat = 0.0
    
    let padding = LayoutConstants.paddingHorizont
    let btnWidth = LayoutConstants.onboardingBtnWidth
    let btnHeight = LayoutConstants.btnHeight
    let radius = LayoutConstants.btnCornerRadius
    
    // MARK: - Body
    var body: some View {
        
        GeometryReader { geometry in
            
            NavigationView {
                
                ZStack {
                    BackgroundGradientView()
                    
                    self.appLogoView
                        .offset(y: self.logoPosition - 10) // TODO: - fix initial center positioning according to LaunchScreen
                        .animation(.linear(duration: 1.0), value: logoPosition)
                    
                    if self.showLoginForm {
                        
                        VStack {
                            Spacer()
                            VStack(spacing: 12.0) {
                                self.emailField
                                    .padding(.horizontal, self.padding)
                                self.passwordField
                                    .padding(.horizontal, self.padding)
                            }
                            
                            VStack(spacing: 4.0) {
                                self.signInButtonView
                                
                                NavigationLink(destination: ResetPasswordView(email: $email)) {
                                    self.forgotPasswordView
                                }
                            }
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            NavigationLink {
                                RegistrationView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                self.signUpField
                            }
                        }
                    }
                }
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        self.logoPosition = -geometry.size.height / 2 + 122
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        self.showLoginForm = true
                    }
                }
            }
        }
    }
    
    // MARK: - Views
    private var appLogoView: some View {
        Text("Communicator")
            .font(
                .custom("SavoyeLetPlain", size: 65)
            )
            .foregroundColor(.white)
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
    
    private var forgotPasswordView: some View {
        Text("Forgot password?")
            .font(.system(size: 13, weight: .semibold))
            .foregroundColor(.white)
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
        .padding(.bottom, 32.0)
        .foregroundColor(.white)
    }
}

// MARK: - Preview
#Preview {
    LoginView()
}
