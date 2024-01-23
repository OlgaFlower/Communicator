//
//  RegistrationView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Properties
    @State private var email = ""
    @State private var fullName = ""
    @State private var userName = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @State private var foregroundColor: Color = .accentColor
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
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
                self.addImageView
                self.emailField
                    .padding(.horizontal, self.padding)
                
                if !self.viewModel.isEmailValid {
                    ErrorTextView(text: ErrorMessages.emailFailedValidation.text)
                }
                self.usernameField
                    .padding(.horizontal, self.padding)
                self.fullNameField
                    .padding(.horizontal, self.padding)
                self.passwordField
                    .padding(.horizontal, self.padding)
                self.signUpButtonView
                
                Spacer()
                self.signInField
            }
            .padding(.top, 56)
            .onAppear {
                
                // Hide AddImage if keyboard is visible
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                    withAnimation {
                        self.foregroundColor = .clear
                    }
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    withAnimation {
                        self.foregroundColor = .accentColor
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
        }
    }
    
    // MARK: - Views
    private var addImageView: some View {
        Group {
            if let image = self.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: self.imgWidth,
                        height: self.imgWidth
                    )
                    .clipShape(Circle())
            }
            else {
                Button(
                    action: {
                        self.imagePickerPresented.toggle()
                    },
                    label: {
                        AddImageView(foregroundColor: self.$foregroundColor)
                    }
                )
                .sheet(
                    isPresented: $imagePickerPresented,
                    onDismiss: self.loadImage,
                    content: {
                        ImagePicker(image: $selectedImage)
                    }
                )
            }
        }
        .padding(.bottom, 12)
    }
    
    private var emailField: some View {
        CustomTextField(
            text: $email,
            placeholder: "Email",
            iconName: "envelope"
        )
        .onTapGesture {
            withAnimation {
                self.viewModel.isEmailValid = true
            }
        }
    }
    
    private var usernameField: some View {
        CustomTextField(
            text: $userName,
            placeholder: "Username",
            iconName: "person"
        )
    }
    
    private var fullNameField: some View {
        CustomTextField(
            text: $fullName,
            placeholder: "Full Name",
            iconName: "person"
        )
    }
    
    private var passwordField: some View {
        CustomTextField(
            text: $password,
            placeholder: "Password",
            iconName: "lock"
        )
        .onTapGesture {
            withAnimation {
                self.viewModel.isPasswordValid = true
            }
        }
    }
    
    private var signUpButtonView: some View {
        Button(
            action: {
                
                self.viewModel.validateEmailAndPassword(self.email, self.password)
                
                if self.viewModel.isEmailValid, self.viewModel.isPasswordValid {
                    
                    self.viewModel.register(
                        newUser:
                            NewUserModel(
                                email: self.email,
                                password: self.password,
                                image: self.selectedImage,
                                fullName: self.fullName,
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
    
    private var signInField: some View {
        Button(
            action: {
                self.mode.wrappedValue.dismiss()
            },
            label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
            }
        )
        .padding(.bottom, 22.0)
    }
}

// MARK: - Extension
extension RegistrationView {
    
    func loadImage() {
        guard let selectedImage = self.selectedImage else { return }
        self.image = Image(uiImage: selectedImage)
    }
}

// MARK: - Preview
#Preview {
    RegistrationView()
}
