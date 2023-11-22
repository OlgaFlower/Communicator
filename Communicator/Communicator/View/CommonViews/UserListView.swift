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
                ForEach(self.viewModel.users) { _ in
                    NavigationLink(
                        destination: ProfileView()) {
                            UserCell()
                                .padding(.leading)
                        }
                }
            }
        }
    }
}
