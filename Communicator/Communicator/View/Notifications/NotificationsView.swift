//
//  NotificationsView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct NotificationsView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel = NotificationsViewModel()
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 20.0) {
                ForEach(self.viewModel.notifications) { notification in
                    NotificationCell(notification: notification)
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
