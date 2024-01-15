//
//  ProfileActionButtonView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.11.23.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: ProfileViewModel
    
    var isFollowed: Bool {
        return self.viewModel.user.isFollowed ?? false
    }
    private let buttonWidth = UIScreen.main.bounds.width * 0.8
    
    // MARK: - Body
    var body: some View {
        
        if self.viewModel.user.isCurrentUser {
            self.editProfileButtonView
        } else {
            HStack {
                self.followButtonView
                self.messageButtonView
            }
        }
    }
    
    // MARK: - Views
    private var editProfileButtonView: some View {
        Button(action: {
            
        }, label: {
            Text("Edit profile")
                .font(.system(size: 14.0, weight: .semibold))
                .frame(width: self.buttonWidth, height: 32.0)
                .foregroundColor(.black)
                .overlay (
                    RoundedRectangle(cornerRadius: 3.0)
                        .stroke(Color.gray, lineWidth: 1.0)
                )
        })
    }
    
    // TODO: - correct Follow and Message button design
    private var followButtonView: some View {
        Button(action: {
            self.isFollowed ? self.viewModel.unfollow() : self.viewModel.follow()
        }, label: {
            Text(self.isFollowed ? "Following" : "Follow")
                .font(.system(size: 14.0, weight: .semibold))
                .frame(width: self.buttonWidth / 2, height: 32.0)
                .foregroundColor(self.isFollowed ? .black : .white)
                .background(self.isFollowed ? Color.white : Color.blue)
                .overlay (
                    RoundedRectangle(cornerRadius: 3.0)
                        .stroke(Color.gray, lineWidth: self.isFollowed ? 1.0 : 0.0)
                )
        })
        .cornerRadius(3.0)
    }
    
    private var messageButtonView: some View {
        Button(action: {
            
        }, label: {
            Text("Message")
                .font(.system(size: 14.0, weight: .semibold))
                .frame(width: self.buttonWidth / 2, height: 32.0)
                .foregroundColor(.black)
                .overlay (
                    RoundedRectangle(cornerRadius: 3.0)
                        .stroke(Color.gray, lineWidth: 1.0)
                )
        })
        .cornerRadius(3.0)
    }
}
