//
//  FeedViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 11.12.23.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    // MARK: - Properties
    @Published var posts = [PostModel]()
    
    // MARK: - Init
    init() {
        self.fetchPosts()
    }
    
    // MARK: - Functions
    func fetchPosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, error in
            
            // TODO: - Handle error
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: PostModel.self) })
        }
    }
}
