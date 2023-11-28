//
//  MainTabView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - Properties
    @Binding var selectedIndex: Int
    let user: User
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            TabView(selection: self.$selectedIndex) {
                FeedView()
                    .onTapGesture {
                        self.selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .tag(0)
                
                SearchView()
                    .onTapGesture {
                        self.selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        self.selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                    .tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        self.selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }
                    .tag(3)
                
                ProfileView(user: self.user)
                    .onTapGesture {
                        self.selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .tag(4)
            }
            .navigationTitle(self.tabTitle)
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
    
    private var tabTitle: String {
        switch self.selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default: return ""
        }
    }
}

