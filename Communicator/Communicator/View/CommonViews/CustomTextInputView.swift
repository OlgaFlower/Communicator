//
//  CustomTextInputView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 18.12.23.
//

import SwiftUI

struct CustomTextInputView: View {
    
    // MARK: - Properties
    @Binding var inputText: String
    
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack {
            SeparatorView()
                .padding(.bottom, 8.0)
            HStack {
                TextField("Comment...", text: self.$inputText)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 30.0)
                
                Button(action: self.action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
    }
}
