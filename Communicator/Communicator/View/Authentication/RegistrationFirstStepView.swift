//
//  RegistrationFirstStepView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 24.01.24.
//

import SwiftUI

struct RegistrationFirstStepView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    
    @State private var userName = ""
    @State private var fullName = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @State private var isKeyboadrActive = false
    @State private var shouldNavigate = false
    
    let padding = LayoutConstants.paddingHorizont
    let imgWidth = LayoutConstants.onboardingRoundedImgWidth
    let btnWidth = LayoutConstants.onboardingBtnWidth
    let btnHeight = LayoutConstants.btnHeight
    let radius = LayoutConstants.btnCornerRadius
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradientView()
            
            VStack {
                self.addImageView
                Spacer()
                
                VStack(alignment: .leading, spacing: 12.0) {
                    self.usernameField
                    if !self.viewModel.isUsernameValid {
                        self.makeErrorView(with: ErrorMessages.usernameNotValid.text)
                    }
                    
                    self.fullNameField
                    if !self.viewModel.isFullnameValid {
                        self.makeErrorView(with: ErrorMessages.fullnameNotValid.text)
                    }
                }
                
                VStack(spacing: 4.0) {
                    NavigationLink(destination: RegistrationSecondStepView(
                        userName: self.userName,
                        fullname: self.fullName,
                        selectedImage: self.selectedImage
                    ), isActive: self.$shouldNavigate) {
                        EmptyView()
                    }
                    .hidden()
                    
                    self.nextButtonView
                        .padding(.top, 4.0)
                    
                    Spacer()
                    self.signInField
                }
            }
        }
        .onAppear {
            // Hide AddImage if keyboard is visible
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                withAnimation {
                    self.isKeyboadrActive = true
                }
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                withAnimation {
                    self.isKeyboadrActive = false
                }
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
                    .opacity(self.isKeyboadrActive ? 0.0 : 1.0)
            }
            else {
                Button(
                    action: {
                        self.imagePickerPresented.toggle()
                    },
                    label: {
                        AddImageView(foregroundColor: self.isKeyboadrActive ? .clear : Color.accentColor)
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
        .padding(.top, 62.0)
        .padding(.bottom, 40.0)
    }
    
    private var usernameField: some View {
        CustomTextField(
            text: $userName,
            placeholder: "Username",
            iconName: "person.icloud"
        )
        .padding(.horizontal, self.padding)
        .onTapGesture {
            withAnimation {
                self.viewModel.isUsernameValid = true
            }
        }
    }
    
    private var fullNameField: some View {
        CustomTextField(
            text: $fullName,
            placeholder: "Full Name",
            iconName: "person"
        )
        .padding(.horizontal, self.padding)
        .onTapGesture {
            withAnimation {
                self.viewModel.isFullnameValid = true
            }
        }
    }
    
    private var nextButtonView: some View {
        Button(
            action: {
                self.viewModel.validateUserNameAndFullName(
                    self.userName,
                    self.fullName
                )
                self.shouldNavigate = self.viewModel.userNamesValid
            },
            label: {
                Text("Next")
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
        .padding(.bottom, 36.0)
    }
    
    private func makeErrorView(with text: String) -> some View {
        ErrorTextView(text: text)
            .padding(.horizontal, 26.0)
    }
}

// MARK: - Extension
extension RegistrationFirstStepView {
    
    func loadImage() {
        guard let selectedImage = self.selectedImage else { return }
        self.image = Image(uiImage: selectedImage)
    }
}

#Preview {
    RegistrationFirstStepView()
}
