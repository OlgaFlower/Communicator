//
//  FeedView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct FeedView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = FeedViewModel()
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32.0) {
                ForEach(self.viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
                .padding(.top)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    FeedView()
}
