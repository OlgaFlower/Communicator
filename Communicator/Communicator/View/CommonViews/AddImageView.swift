//
//  AddImageView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 29.11.23.
//

import SwiftUI

struct AddImageView: View {
    
    // MARK: - Properties
    let width = LayoutConstants.onboardingRoundedImgWidth
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(.accent, lineWidth: 1.0)
            
            Image("addIcon")
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(
                    width: 24.0,
                    height: 24.0
                )
                .foregroundColor(.white)
        }
        .frame(
            width: self.width,
            height: self.width
        )
    }
}

// MARK: - Preview
#Preview {
    AddImageView()
}
