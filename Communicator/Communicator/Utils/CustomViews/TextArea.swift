//
//  TextArea.swift
//  Communicator
//
//  Created by Olha Bereziuk on 28.11.23.
//

import SwiftUI

struct TextArea: View {
    
    // MARK: - Properties
    @Binding var text: String
    let placeholder: String
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                if text.isEmpty {
                    Text(self.placeholder)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 4)
                }
            }
            .padding(.top, 8)
            
            VStack {
                TextEditor(text: $text)
                    .opacity(self.text.isEmpty ? 0.1 : 1)
                    .disableAutocorrection(true)
                Spacer()
            }
            .padding(.top, 0)
        }
    }
}

// MARK: - Preview
#Preview {
    TextArea(text: .constant(""), placeholder: "Enter text here")
}
