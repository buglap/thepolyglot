//
//  HomeView.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        GeometryReader {geo in
            ZStack {
                VStack(alignment: .leading) {
                    viewModel.getPageContent()
                    Spacer()
                }
                VStack(alignment: .trailing) {
                    Spacer()
                    MenuView(currentHomePage: $viewModel.currentHomePage)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .edgesIgnoringSafeArea(.bottom)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
