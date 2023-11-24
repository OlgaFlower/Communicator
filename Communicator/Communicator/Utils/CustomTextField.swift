//
//  CustomTextField.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct CustomTextField: View {
    
    // MARK: - Properties
    @Binding var text: String
    let placeholder: String
    let iconName: String
    private let iconWidth = 12.0
    
    // MARK: - Body
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10.0)
            .foregroundColor(Color(.init(white: 1, alpha: 0.2)))
            .frame(height: 50)
            .overlay(
                HStack(spacing: 10.0) {
                    self.iconView
                    TextField(placeholder, text: $text)
                        .foregroundColor(.white)
                }
                    .padding(.horizontal, 20.0)
            )
    }
    
    // MARK: - Views
    private var iconView: some View {
        Image(systemName: self.iconName)
            .resizable()
            .scaledToFill()
            .frame(width: self.iconWidth, height: self.iconWidth)
            .foregroundColor(.white)
    }
}
