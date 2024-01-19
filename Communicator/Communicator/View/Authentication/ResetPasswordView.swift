//
//  ResetPasswordView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.01.24.
//

import SwiftUI

struct ResetPasswordView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String
    
    let btnWidth = LayoutConstants.onboardingBtnWidth
    let btnHeight = LayoutConstants.btnHeight
    let radius = LayoutConstants.btnCornerRadius
    let padding = LayoutConstants.paddingHorizont
    
    // MARK: - Initializator
    init(email: Binding<String>) {
        self._email = email
    }
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            BackgroundGradientView()
            
            VStack {
                
                
                CustomTextField(text: $email, placeholder: "Email", iconName: "envelope")
                    .padding(.horizontal, self.padding)
                
                self.signInButtonView
            }
        }
        .onReceive(self.viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
    
    // MARK: - Views
    
    private var signInButtonView: some View {
        Button(
            action: {
                self.viewModel.resetPassword(withEmail: email)
            },
            label: {
                Text("Reset password")
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
}
