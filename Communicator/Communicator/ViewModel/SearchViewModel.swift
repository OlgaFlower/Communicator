//
//  SearchViewModel.swift
//  Communicator
//
//  Created by Olha Bereziuk on 22.11.23.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var users = [User]()
    
    // MARK: - Initializator
    init() {
        self.fetchUsers()
    }
    
    // MARK: - Functions
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let userDocuments = snapshot?.documents else { return }
            self.users = userDocuments.compactMap { try? $0.data(as: User.self) }
        }
    }
    
    func filteredUsers(_ byText: String) -> [User] {
        let query = byText.lowercased()
        return users.filter { $0.fullName.lowercased().contains(query) || $0.userName.lowercased().contains(query) }
    }
}
