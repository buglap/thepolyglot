//
//  Menu.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct MenuView: View {
    @Binding var currentHomePage: MenuOptions
    var body: some View {
        HStack(alignment: .center){
            Button(action: {
                currentHomePage = .news
            }) {
                MenuItemView(title: "News", icon: "newspaper", isSelected: (currentHomePage == .news))
            }
            Spacer()
            Button(action: {
                currentHomePage = .notes
            }) {
                MenuItemView(title: "Notes", icon: "note", isSelected: (currentHomePage == .notes))
            }
            Spacer()
            Button(action: {
                currentHomePage = .account
            }) {
                MenuItemView(title: "Profile", icon: "person", isSelected: (currentHomePage == .account))
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
        MenuView(currentHomePage: .constant(.news))
    }
}

