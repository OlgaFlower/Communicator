//
//  NotificationCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    // MARK: - Properties
    @State private var showPostImage = false
    let notification: NotificationModel
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            self.imageView
            self.textView
            Spacer()
            
            if self.notification.type == .follow {
                self.followButtonView
            } else {
                self.postImageView
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Views
    private var imageView: some View {
        KFImage(URL(string: self.notification.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
    }
    
    private var textView: some View {
        Text(self.notification.userName)
            .font(.system(size: 14, weight: .semibold))
        +
        Text(self.notification.type.notificationMessage)
            .font(.system(size: 15))
    }
    
    private var postImageView: some View {
        Image("avatar3")
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
    }
    
    private var followButtonView: some View {
        Button {
            
        } label: {
            Text("Follow")
                .padding(.horizontal, 20.0)
                .padding(.vertical, 8.0)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .font(.system(size: 14, weight: .semibold))
        }
    }
}
