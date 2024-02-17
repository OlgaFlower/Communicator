//
//  FeedView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

// TODO: - Display posts according to load time

struct FeedView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = FeedViewModel()
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24.0) {
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
