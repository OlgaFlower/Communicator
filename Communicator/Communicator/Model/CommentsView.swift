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
        
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 22) {
                    ForEach(0 ..< 10) { _ in
                        CommentCell()
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
}
