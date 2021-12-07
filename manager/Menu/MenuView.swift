//
//  Menu.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        HStack(alignment: .center){
            Button(action: {
                viewModel.currentHomePage = .news
            }) {
                MenuItemView(title: "News", icon: "newspaper", isSelected: (viewModel.currentHomePage == .news))
            }
            Button(action: {
                viewModel.currentHomePage = .vocaburary
            }) {
                MenuItemView(title: "Vocabulary", icon: "brain", isSelected: (viewModel.currentHomePage == .vocaburary))
            }
            Button(action: {
                viewModel.currentHomePage = .notes
            }) {
                MenuItemView(title: "Notes", icon: "note", isSelected: (viewModel.currentHomePage == .notes))
            }
            Button(action: {
                viewModel.currentHomePage = .account
            }) {
                MenuItemView(title: "Profile", icon: "person", isSelected: (viewModel.currentHomePage == .account))
            }
        }.padding(.horizontal)
            .font(.footnote)
            .background(Color.customBlue)
            .cornerRadius(20)
            .frame(width: UIScreen.width * 0.9, height:UIScreen.width * 0.2)
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

