//
//  SearchbarView.swift
//  manager
//
//  Created by Jenny escobar on 13/12/21.
//

import SwiftUI

struct SearchbarView: View {
    @ObservedObject var searchNewsViewModel: SearchNewsViewModel = SearchNewsViewModel.shared
    @State private var isEditing = false
    @State private var currentSearch = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Find something in the news", text: $currentSearch, onCommit: {
                    searchNewsViewModel.currentSearchText = currentSearch
                    searchNewsViewModel.searchNews()
                }).padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass.circle")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.currentSearch = ""
                                searchNewsViewModel.currentSearchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                    .padding(.horizontal, 2)
                    .onTapGesture {
                        self.isEditing = true
                    }
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.currentSearch = ""
                    }) {
                        Text("Cancel")
                    }.padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                }
            }
        }
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView()
    }
}
