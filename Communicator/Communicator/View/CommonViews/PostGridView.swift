//
//  PostGridView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        
        LazyVGrid(columns: items, spacing: 3, content: {
            ForEach(0 ..< 10) { _ in
                NavigationLink(destination: FeedView()) {
                    Image("picture2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: self.width, height: self.width)
                        .clipped()

                }
            }
        })
    }
}

#Preview {
    PostGridView()
}
