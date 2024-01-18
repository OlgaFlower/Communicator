//
//  UserListView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI

struct UserListView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    private var users: [User] {
        return self.searchText.isEmpty ? self.viewModel.users : self.viewModel.filteredUsers(self.searchText)
    }
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(self.users) { user in
                    NavigationLink(
                        // TODO: - Check and refactor other views for unnecessary preloading of the user data 
                        destination: LazyView(ProfileView(user: user)) // LazyView allow to build view when its necessary and avoid fetching all profiles in a list atonce
                    ) {
                            UserCell(user: user)
                                .padding(.leading)
                        }
                }
            }
        }
    }
}
