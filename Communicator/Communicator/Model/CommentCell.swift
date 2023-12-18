//
//  CommentCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.12.23.
//

import SwiftUI
import Kingfisher
import Firebase

struct CommentCell: View {
    
    // MARK: - Properties
    let comment: CommentModel
    var imageWidth = 42.0
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            KFImage(URL(string: self.comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(
                    width: self.imageWidth,
                    height: self.imageWidth
                )
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                self.commentInfoView
                self.commentView
            }
        }
        .padding(.horizontal)
    }
    
    var commentInfoView: some View {
        HStack {
            Text(self.comment.userName)
                .font(.system(size: 14.0, weight: .semibold))
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
    }
    
    var commentView: some View {
        Text(self.comment.commentText)
            .font(.system(size: 14))
    }
}
