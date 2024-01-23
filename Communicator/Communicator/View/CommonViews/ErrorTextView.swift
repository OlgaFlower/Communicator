//
//  ErrorTextView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 23.01.24.
//

import SwiftUI

struct ErrorTextView: View {
    
    // MARK: - Properties
    let text: String
    
    // MARK: - Body
    var body: some View {
        
        Text(text)
            .font(.system(size: 14))
            .foregroundColor(CustomColor.red)
        
    }
}

// MARK: - Preview
#Preview {
    ErrorTextView(text: "Please enter a valid email address.")
}
