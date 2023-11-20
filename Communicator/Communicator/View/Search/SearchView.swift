//
//  SearchView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 16.11.23.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Propereties
    @State var searchText = ""
    @State var inSearchMode = false
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
        
    }
}

// MARK: - Preview
#Preview {
    SearchView()
}
