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
    @ObservedObject var viewModel: FeedCellViewModel
    
    private var didLike: Bool {
        return self.viewModel.post.didLike ?? false
    }
    private let userImgWidth = 36.0
    
    // MARK: - Init
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            self.userInfoView
                .padding([.leading, .bottom], 8.0)
            self.postImageView
            
            HStack(spacing: 16.0) {
                self.likeIcon
                
                NavigationLink(destination: CommentsView(post: self.viewModel.post)) {
                    self.commentsIcon
                }
                self.makeButton(iconName: "paperplane")
            }
            .padding(.leading, 4.0)
            .foregroundColor(.black)
            
            NavigationLink(destination: LikesView(postId: self.viewModel.post.id)) {
                if self.viewModel.post.likes > 1 {
                    self.likesView
                }
            }
            self.postDescriptionView
            self.postAgeView
        }
    }
    
    // MARK: - Views
    private var userInfoView: some View {
        HStack {
            KFImage(URL(string: self.viewModel.post.ownerImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: self.userImgWidth, height: self.userImgWidth)
                .clipped()
                .clipShape(Circle())
            
            Text(self.viewModel.post.ownerUserName)
                .font(.system(size: 14, weight: .semibold))
        }
    }
    
    private var postImageView: some View {
        KFImage(URL(string: self.viewModel.post.imageUrl))
            .resizable()
            .scaledToFill()
            .frame(maxHeight: 400.0)
            .clipped()
    }
    
    private var likeIcon: some View {
        Button {
            self.didLike ? self.viewModel.unlike() : self.viewModel.like()
        } label: {
            Image(systemName: self.didLike ? "heart.fill" : "heart")
                .resizable()
                .scaledToFill()
                .foregroundColor(self.didLike ? .red : .black)
                .frame(width: 20.0, height: 20.0)
                .font(.system(size: 20))
                .padding(4.0)
        }
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
        Text(self.viewModel.likeString)
            .font(.system(size: 14, weight: .semibold))
            .padding(.leading, 8.0)
            .padding(.bottom, 2.0)
    }
    
    private var commentsIcon: some View {
        Image(systemName: "bubble.right")
            .resizable()
            .scaledToFill()
            .frame(width: 20.0, height: 20.0)
            .font(.system(size: 20))
            .padding(4.0)
    }
    
    private var postDescriptionView: some View {
        HStack {
            Text(self.viewModel.post.ownerUserName)
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" \(self.viewModel.post.caption)")
                .font(.system(size: 15))
        }
        .padding(.horizontal, 8.0)
    }
    
    private var postAgeView: some View {
        Text(self.viewModel.timestampString)
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .padding(.leading, 8.0)
            .padding(.top, 4.0)
    }
}
