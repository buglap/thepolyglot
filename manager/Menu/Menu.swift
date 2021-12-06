//
//  Menu.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct Menu: View {
    @State var selectedTag: MenuOptions?
    var body: some View {
        HStack(alignment: .bottom){
            Button(action: {
                selectedTag = .news
            }) {
                MenuItem(title: "News", icon: "newspaper", isSelected: (selectedTag == .news))
            }
            Button(action: {
                selectedTag = .vocaburary
            }) {
                MenuItem(title: "Vocabulary", icon: "brain", isSelected: (selectedTag == .vocaburary))
            }
            Button(action: {
                selectedTag = .notes
            }) {
                MenuItem(title: "Notes", icon: "note", isSelected: (selectedTag == .notes))
            }
            Button(action: {
                selectedTag = .account
            }) {
                MenuItem(title: "Profile", icon: "person", isSelected: (selectedTag == .account))
            }
        }.padding(.horizontal)
            .font(.footnote)
            .background(Color.customBlue)
            .cornerRadius(20)
            .frame(width: UIScreen.width * 0.9, height:UIScreen.width * 0.2)
        
    }
}

enum MenuOptions {
    case account, news, vocaburary, notes
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

