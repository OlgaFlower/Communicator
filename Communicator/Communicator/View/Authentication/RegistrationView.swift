//
//  RegistrationView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    let userName: String
    let fullname: String
    let selectedImage: UIImage?
    
    let padding = LayoutConstants.paddingHorizont
    let imgWidth = LayoutConstants.onboardingRoundedImgWidth
    let btnWidth = LayoutConstants.onboardingBtnWidth
    let btnHeight = LayoutConstants.btnHeight
    let radius = LayoutConstants.btnCornerRadius
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradientView()
            
                VStack(spacing: 12.0) {
                    
                    self.emailField
                    if !self.viewModel.isEmailValid {
                        ErrorTextView(text: ErrorMessages.emailFailedValidation.text)
                    }
                    
                    self.passwordField
                    if !self.viewModel.isPasswordValid {
                        ErrorTextView(text: ErrorMessages.passwordFailedValidation.text)
                    }
                    
                    self.signUpButtonView
                        .padding(.top, 4.0)
                }
                .padding(.top, 10)
                Spacer()
            }
    }
    
    // MARK: - Views
    
    private var emailField: some View {
        CustomTextField(
            text: $email,
            placeholder: "Email",
            iconName: "envelope"
        )
        .padding(.horizontal, self.padding)
        .onTapGesture {
            withAnimation {
                self.viewModel.isEmailValid = true
            }
        }
    }
    
    private var passwordField: some View {
        CustomTextField(
            text: $password,
            placeholder: "Password",
            iconName: "lock"
        )
        .padding(.horizontal, self.padding)
        .onTapGesture {
            withAnimation {
                self.viewModel.isPasswordValid = true
            }
        }
    }
    
    private var signUpButtonView: some View {
        Button(
            action: {
                
                self.viewModel.validateEmailAndPassword(
                    self.email,
                    self.password
                )
                
                if self.viewModel.emailAndPasswordValid {
                    
                    self.viewModel.register(
                        newUser:
                            NewUserModel(
                                email: self.email,
                                password: self.password,
                                image: self.selectedImage,
                                fullName: self.fullname,
                                userName: self.userName
                            )
                    )
                }
            },
            label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: self.btnWidth, height: self.btnHeight)
                    .overlay (
                        RoundedRectangle(cornerRadius: self.radius)
                            .stroke(CustomColor.blueWithOpacity, lineWidth: 1.0)
                    )
                    .padding(.top, 12)
            }
        )
    }
    
    private func makeErrorView(with text: String) -> some View {
        ErrorTextView(text: text)
            .padding(.horizontal, 24.0)
    }
}

// MARK: - Preview
#Preview {
    RegistrationView(userName: "marianna_2024", fullname: "Marianna Franchesco", selectedImage: nil)
}
