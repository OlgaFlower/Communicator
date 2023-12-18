//
//  CommentsView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.12.23.
//

import SwiftUI

struct CommentsView: View {
    
    // MARK: - Properties
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    // MARK: - Init
    init(post: PostModel) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    // MARK: - Body
    var body: some View {
        
        if self.viewModel.comments.isEmpty {
            self.noCommentsView
                .frame(maxWidth: .infinity)
                .padding(.top, 140)
        }
        
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 18) {
                    ForEach(self.viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }
            .padding(.top)
            
            CustomTextInputView(inputText: self.$commentText, action: self.uploadComment)
        }
    }
    
    private func uploadComment() {
        self.viewModel.uploadComment(self.commentText)
        self.commentText = ""
    }
    
    private var noCommentsView: some View {
        Text("NO COMMENTS YET")
            .font(.system(size: 22, weight: .semibold))
    }
}
