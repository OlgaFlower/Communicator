//
//  PostGridView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    // MARK: - Properties
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    @ObservedObject var viewModel: PostGridViewModel
    
    init(type: PostGridType) {
        self.viewModel = PostGridViewModel(type: type)
    }
    
    // MARK: - Body
    var body: some View {
        
        LazyVGrid(columns: items, spacing: 3, content: {
            ForEach(self.viewModel.posts) { post in
                
                NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: self.width, height: self.width)
                        .clipped()
                }
            }
        })
    }
}

//#Preview {
//    PostGridView()
//}
