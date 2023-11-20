//
//  CustomTextField.swift
//  Communicator
//
//  Created by Olha Bereziuk on 20.11.23.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    let iconName: String
    private let iconWidth = 12.0
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            if self.text.isEmpty {
                self.placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: self.iconName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: self.iconWidth, height: self.iconWidth)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}
