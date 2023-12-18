//
//  SeparatorView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 18.12.23.
//

import SwiftUI

struct SeparatorView: View {
    
    // MARK: - Properties
    private var separatorWidth = UIScreen.main.bounds.width
    
    // MARK: - Body
    var body: some View {
        Rectangle()
            .foregroundColor(Color(.separator))
            .frame(width: self.separatorWidth, height: 0.75)
    }
}

#Preview {
    SeparatorView()
}
