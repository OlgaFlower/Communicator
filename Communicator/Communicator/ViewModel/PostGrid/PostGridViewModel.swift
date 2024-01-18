//
//  PostGridViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 11.12.23.
//

import SwiftUI

enum PostGridType {
    case search
    case profile(String)
//    case hashtag(String) //by hashtag
}

class PostGridViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var posts = [PostModel]()
    
    // MARK: - Init
    init(type: PostGridType) {
        self.fetchPosts(forType: type)
    }
    
    func fetchPosts(forType type: PostGridType) {
        switch type {
        case .search:
            self.fetchSearchPagePosts()
        case .profile(let uid):
            self.fetchUserPosts(forUid: uid)
        }
    }
    
    // MARK: - Functions
    func fetchSearchPagePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, error in
            
            // TODO: - Handle error
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: PostModel.self) })
        }
    }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, error in
                
            // TODO: Handle error
            
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: PostModel.self) })
            self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        }
    }
}
