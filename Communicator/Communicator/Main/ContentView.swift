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
    
    // MARK: - Body
    var body: some View {
        
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
