//
//  MenuItemView.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct MenuItemView: View {
    let title: String
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        let selectionColor = (isSelected) ? Color.fucsia: .white
        VStack {
            Image(systemName: icon)
            Text(title)
        }.padding().foregroundColor(selectionColor)
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(title: "profile", icon: "person", isSelected: true)
    }
}
