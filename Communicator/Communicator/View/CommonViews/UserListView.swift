//
//  UserListView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 17.11.23.
//

import SwiftUI

struct UserListView: View {
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 20) { _ in
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

#Preview {
    UserListView()
}
