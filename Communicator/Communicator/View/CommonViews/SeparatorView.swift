//
//  SeparatorView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 18.12.23.
//

import SwiftUI

struct SeparatorView: View {
    
    // MARK: - Body
    var body: some View {
        Rectangle()
            .foregroundColor(Color(.separator))
            .frame(height: 0.75)
    }
}

#Preview {
    SeparatorView()
}
