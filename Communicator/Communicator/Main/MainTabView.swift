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
    @State var showMenu = false
    let user: User
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            TabView(selection: self.$selectedIndex) {
                
                // MARK: Feed
                FeedView()
                    .onTapGesture {
                        self.selectedIndex = 0
                    }
                    .tabItem {
                        Image("home")
                    }
                    .tag(0)
                
                // MARK: Explore
                SearchView()
                    .onTapGesture {
                        self.selectedIndex = 1
                    }
                    .tabItem {
                        Image("magnifier")
                    }
                    .tag(1)
                
                // MARK: New Post
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        self.selectedIndex = 2
                    }
                    .tabItem {
                        Image("add")
                    }
                    .tag(2)
                
                // MARK: Notifications
                NotificationsView()
                    .onTapGesture {
                        self.selectedIndex = 3
                    }
                    .tabItem {
                        Image("heart")
                    }
                    .tag(3)
                
                // MARK: Profile
                ProfileView(user: self.user)
                    .onTapGesture {
                        self.selectedIndex = 4
                    }
                    .tabItem {
                        Image("profile")
                    }
                    .tag(4)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.browser)
            .navigationBarItems(
                leading:
                    Text("Communicator")
                    .font(
                        .custom("SavoyeLetPlain", size: 40)
                    )
                    .padding(.top, 4)
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    self.menuButton
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
    
    private var menuButton: some View {
        Button(action: {
            self.showMenu.toggle()
        }, label: {
            Image("hamburger")
        })
        .sheet(isPresented: self.$showMenu) {
            MenuView()
        }
    }
}

