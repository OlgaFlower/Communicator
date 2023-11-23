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
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(self.viewModel.users) { user in
                    NavigationLink(
                        destination: ProfileView()) {
                            UserCell(user: user)
                                .padding(.leading)
                        }
                }
            }
        }
    }
}
