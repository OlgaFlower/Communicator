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
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    private let buttonWidth = UIScreen.main.bounds.width * 0.8
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            self.linearGradient
            
            VStack {
                self.imageView
                
                VStack(spacing: 20) {
                    self.emailField
                    self.usernameField
                    self.fullNameField
                    self.passwordField
                    self.signUpButtonView
                    Spacer()
                    self.signInField
                }
                .padding(.horizontal, 36)
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
    
    private var imageView: some View {
        Group {
            if let image = self.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.vertical, 32)
            } else {
                Button(action: {
                    self.imagePickerPresented.toggle()
                }, label: {
                    Image("uploadImageIcon")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.vertical, 32)
                })
                .sheet(
                    isPresented: $imagePickerPresented,
                    onDismiss: self.loadImage,
                    content: {
                        ImagePicker(image: $selectedImage)
                    })
            }
        }
    }
    
    private var emailField: some View {
        CustomTextField(
            text: $email,
            placeholder: "Email",
            iconName: "envelope"
        )
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
    }
    
    private var signUpButtonView: some View {
        Button(action: {
            self.viewModel.register(newUser:
                                        NewUserModel(
                                            email: self.email,
                                            password: self.password,
                                            image: self.selectedImage,
                                            fullName: self.fullName,
                                            userName: self.userName
                                        )
            )
        }, label: {
            Text("Sign Up")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: self.buttonWidth, height: 50)
                .background(Color(.accent))
                .clipShape(Capsule())
                .padding()
        })
    }
    
    private var signInField: some View {
        Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Text("Already have an account?")
                    .font(.system(size: 14))
                Text("Sign In")
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.white)
        })
        .padding(.bottom, 16)
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
