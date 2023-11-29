//
//  BackgroundGradientView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 29.11.23.
//

import SwiftUI

struct BackgroundGradientView: View {
    
    // MARK: - Properties
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    // MARK: - Body
    var body: some View {
        Image("launchScreenGradientImg")
            .resizable()
            .scaledToFill()
            .frame(
                width: self.width,
                height: self.height
            )
            .ignoresSafeArea(.all)
    }
}

// MARK: - Preview
#Preview {
    BackgroundGradientView()
}
