//
//  ProfileActionButtonView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 19.11.23.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    // MARK: - Properties
    let isCurrentUser: Bool
    var isFollowed = false
    private let buttonWidth = UIScreen.main.bounds.width * 0.8
    
    // MARK: - Body
    var body: some View {
        
        if self.isCurrentUser {
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
                .frame(width: self.buttonWidth, height: 32)
                .foregroundColor(.black)
                .overlay (
                    RoundedRectangle(cornerRadius: 3.0)
                        .stroke(Color.gray, lineWidth: 1.0)
                )
        })
    }
    
    private var followButtonView: some View {
        Button(action: {
            
        }, label: {
            Text(self.isFollowed ? "Following" : "Follow")
                .font(.system(size: 14.0, weight: .semibold))
                .frame(width: self.buttonWidth / 2, height: 32)
                .foregroundColor(self.isFollowed ? .black : .white)
                .background(isFollowed ? Color.white : Color.blue)
                .overlay (
                    RoundedRectangle(cornerRadius: 3.0)
                        .stroke(Color.gray, lineWidth: self.isFollowed ? 1.0 : 0)
                )
        })
        .cornerRadius(3.0)
    }
    
    private var messageButtonView: some View {
        Button(action: {
            
        }, label: {
            Text("Message")
                .font(.system(size: 14.0, weight: .semibold))
                .frame(width: self.buttonWidth / 2, height: 32)
                .foregroundColor(.black)
                .overlay (
                    RoundedRectangle(cornerRadius: 3.0)
                        .stroke(Color.gray, lineWidth: 1.0)
                )
        })
        .cornerRadius(3.0)
    }
}

#Preview {
    Group {
        ProfileActionButtonView(isCurrentUser: true)
            .padding(.bottom, 100.0)
        ProfileActionButtonView(isCurrentUser: false)
    }
}
