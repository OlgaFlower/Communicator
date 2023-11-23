//
//  MainTabView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - Properties
    let user: User
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                ProfileView(user: self.user)
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.browser)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    self.logoutButton
                }
            }
            .accentColor(.black)
        }
    }
    
    private var logoutButton: some View {
        Button(action: {
            AuthViewModel.shared.signOut()
        }, label: {
            Text("Logout").foregroundColor(.black)
        })
    }
}

