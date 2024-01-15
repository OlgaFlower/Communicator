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
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool {
        return self.viewModel.notification.isFollowed ?? false
    }
    
    // MARK: - Initializator
    init(notification: NotificationModel) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            if let user = self.viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    self.imageView
                }
            }
            
            // TODO: - add nav link leading to the commented or liked post
            self.textView
            Spacer()
            
            if self.viewModel.notification.type == .follow {
                self.followButtonView
            }
            
            if let post = self.viewModel.notification.post {
                NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                    self.loadPostImage(post: post)
                }
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Views
    private var imageView: some View {
        KFImage(URL(string: self.viewModel.notification.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
    }
    
    private var textView: some View {
        Text(self.viewModel.notification.userName)
            .font(.system(size: 14, weight: .semibold))
        +
        Text(self.viewModel.notification.type.notificationMessage)
            .font(.system(size: 15))
    }
    
    private func loadPostImage(post: PostModel) -> some View {
        KFImage(URL(string: post.imageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipped()
    }
    
    private var followButtonView: some View {
        Button {
            self.isFollowed ? self.viewModel.unfollow() : self.viewModel.follow()
        } label: {
            Text(self.isFollowed ? "Following" : "Follow")
                .padding(.horizontal, 20.0)
                .padding(.vertical, 8.0)
                .frame(width: 112.0, height: 32.0)
                .background(self.isFollowed ? Color.white : Color.blue)
                .foregroundColor(self.isFollowed ? .black : .white)
                .font(.system(size: 14, weight: .semibold))
                .clipShape(Capsule())
                .overlay (
                    Capsule()
                        .stroke(Color.gray, lineWidth: self.isFollowed ? 1.0 : 0.0)
                )
        }
    }
}
