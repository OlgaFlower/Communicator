//
//  NotificationCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI

struct NotificationCell: View {
    
    // MARK: - Properties
    @State private var showPostImage = false
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            self.imageView
            self.textView
            Spacer()
            
            if showPostImage {
                self.postImageView
            } else {
                self.followButtonView
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Views
    private var imageView: some View {
        Image("avatar3")
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
    }
    
    private var textView: some View {
        Text("Lisa_32")
            .font(.system(size: 14, weight: .semibold))
        +
        Text(" liked one of your posts.")
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

// MARK: - Preview
#Preview {
    NotificationCell()
}
