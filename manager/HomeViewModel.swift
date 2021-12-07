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
    static let shared = HomeViewModel()
    
    init(){
        self.currentHomePage = .news
    }
    
    func getPageContent() -> some View {
        switch currentHomePage {
        case .account:
            return AnyView(ProfileView())
        case .news:
            return AnyView(NewsColletion())
        case .vocaburary:
            return AnyView(VocabularyView())
        case .notes:
            return AnyView(NotesView())
        }
    }
}


enum MenuOptions {
    case account, news, vocaburary, notes
}
