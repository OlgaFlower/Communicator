//
//  EditProfileView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.01.24.
//

import SwiftUI

struct EditProfileView: View {
    
    // MARK: - Properties
    @Environment(\.presentationMode) var mode
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: User
    @State private var bioText: String
    
    // MARK: - Initializator
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: self._user.wrappedValue.bio ?? "")
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                self.cancelButtonView
                Spacer()
                self.doneButtonView
            }
            .padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(height: 150.0)
                .padding(.horizontal)
            
            Spacer()
        }
        .onReceive(self.viewModel.$uploadComplete) { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = self.viewModel.user.bio
            }
        }
    }
    
    // MARK: - Views
    private var cancelButtonView: some View {
        Button {
            self.mode.wrappedValue.dismiss()
        } label: {
            Text("Cancel")
        }
    }
    
    private var doneButtonView: some View {
        Button {
            self.viewModel.saveUserBio(self.bioText)
        } label: {
            Text("Done").bold()
        }
    }
}
