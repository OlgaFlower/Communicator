//
//  ContentView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    // MARK: - Body
    var body: some View {
        Group {
            if self.viewModel.userSession == nil {
                LoginView()
            } else {
                if let user = self.viewModel.currentUser {
                    MainTabView(selectedIndex: self.$selectedIndex, user: user)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
