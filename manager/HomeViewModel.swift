//
//  HomeViewModel.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentHomePage: MenuOptions
    
    init(){
        self.currentHomePage = .news
    }
    
    func getPageContent() -> some View {
        switch currentHomePage {
        case .account:
            return AnyView(ProfileView())
        case .news:
            return AnyView(NewsColletion())
        case .notes:
            return AnyView(NotesView())
        }
    }
}


enum MenuOptions {
    case account, news, notes
}
