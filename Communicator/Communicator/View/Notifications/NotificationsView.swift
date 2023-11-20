//
//  NotificationsView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct NotificationsView: View {
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0 ..< 20) { _ in
                    NotificationCell()
                        .padding(.top)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NotificationsView()
}
