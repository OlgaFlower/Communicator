//
//  FeedCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    // MARK: - Properties
    private let userImgWidth = 36.0
    let post: PostModel
    
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
            KFImage(URL(string: self.post.ownerImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: self.userImgWidth, height: self.userImgWidth)
                .clipped()
                .clipShape(Circle())
            
            Text(self.post.ownerUserName)
                .font(.system(size: 14, weight: .semibold))
        }
    }
    
    private var postImageView: some View {
        KFImage(URL(string: self.post.imageUrl))
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
        Text("\(self.post.likes) likes")
            .font(.system(size: 14, weight: .semibold))
            .padding(.leading, 8.0)
            .padding(.bottom, 2.0)
    }
    
    private var postDescriptionView: some View {
        HStack {
            Text(self.post.ownerUserName)
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" \(self.post.caption)")
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
//#Preview {
//    FeedCell(post: PostModel(ownerUid: <#T##String#>, ownerUserName: <#T##String#>, caption: <#T##String#>, likes: <#T##Int#>, imageUrl: <#T##String#>, timeStamp: <#T##Timestamp#>, ownerImageUrl: <#T##String#>))
//}
