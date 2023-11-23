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
    @ObservedObject var viewModel = SearchViewModel()
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            SearchBar(text: self.$searchText, isEditing: self.$inSearchMode)
                .padding()
            ZStack {
                if self.inSearchMode {
                    UserListView(viewModel: self.viewModel, searchText: self.$searchText)
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
