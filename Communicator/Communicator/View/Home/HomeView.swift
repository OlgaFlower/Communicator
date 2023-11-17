//
//  FeedView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(0..<10) { _ in
                    FeedCell()
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    FeedView()
}
