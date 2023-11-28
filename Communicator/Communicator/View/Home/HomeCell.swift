//
//  FeedCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct FeedCell: View {
    
    // MARK: - Properties
    private let userImgWidth = 36.0
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            self.userInfoView
                .padding([.leading, .bottom], 8.0)
            self.postImageView
            
            HStack(spacing: 16.0) {
                self.makeButton(iconName: "heart")
                self.makeButton(iconName: "bubble.right")
                self.makeButton(iconName: "paperplane")
            }
            .padding(.leading, 4.0)
            .foregroundColor(.black)
            
            self.likesView
            self.postDescriptionView
            self.postAgeView
        }
    }
    
    // MARK: - Views
    private var userInfoView: some View {
        HStack {
            Image("avatar1")
                .resizable()
                .scaledToFill()
                .frame(width: self.userImgWidth, height: self.userImgWidth)
                .clipped()
                .clipShape(Circle())
            
            Text("Maruna")
                .font(.system(size: 14, weight: .semibold))
        }
    }
    
    private var postImageView: some View {
        Image("picture1")
            .resizable()
            .scaledToFill()
            .frame(maxHeight: 400.0)
            .clipped()
    }
    
    private func makeButton(iconName: String) -> some View {
        Button {
            
        } label: {
            Image(systemName: iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 20.0, height: 20.0)
                .font(.system(size: 20))
                .padding(4.0)
        }
    }
    
    private var likesView: some View {
        Text("3 likes")
            .font(.system(size: 14, weight: .semibold))
            .padding(.leading, 8.0)
            .padding(.bottom, 2.0)
    }
    
    private var postDescriptionView: some View {
        HStack {
            Text("Maruna")
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")
                .font(.system(size: 15))
        }
        .padding(.horizontal, 8.0)
    }
    
    private var postAgeView: some View {
        Text("2d")
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .padding(.leading, 8.0)
            .padding(.top, 4.0)
    }
}

// MARK: - Preview
#Preview {
    FeedCell()
}
