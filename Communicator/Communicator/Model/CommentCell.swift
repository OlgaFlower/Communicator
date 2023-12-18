//
//  CommentCell.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.12.23.
//

import SwiftUI

struct CommentCell: View {
    
    private var imageWidth = 42.0
    
    var body: some View {
        
        HStack {
            Image("avatar2")
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
    
    private var commentInfoView: some View {
        HStack {
            Text("Moolliee")
                .font(.system(size: 14.0, weight: .semibold))
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
    }
    
    private var commentView: some View {
        Text("some test comment")
            .font(.system(size: 14))
    }
}

#Preview {
    CommentCell()
}
