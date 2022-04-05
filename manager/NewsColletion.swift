//
//  NewsColletion.swift
//  manager
//
//  Created by Jenny escobar on 6/12/21.
//

import SwiftUI

struct NewsColletion: View {
    @ObservedObject var searchNewsViewModel: SearchNewsViewModel = SearchNewsViewModel.shared
    @ObservedObject var noteListViewModel = NoteListViewModel()
    var body: some View {
        VStack {
            VStack {
                SearchbarView().environmentObject(searchNewsViewModel)
                PickerView(mapChoioceString: $searchNewsViewModel.currentSelectedLanguage, settings: searchNewsViewModel.availableLanguages)
            }.padding([.top], 20).padding(.bottom, 4)
            if searchNewsViewModel.isLoadingSearch {
                VStack {
                    Spacer()
                    Text("searching...")
                    LottieView(name: "searching")
                    Spacer()
                }
            } else {
                if let currentSearchedNews = searchNewsViewModel.currentSearchedNews?.articles {
                    if searchNewsViewModel.didSearchFail {
                        VStack(alignment: .center) {
                            Spacer()
                            LottieView(name: "no-found").frame(height: 200)
                            Text("We coun't find anything with \"\(searchNewsViewModel.currentSearchText)\"; \ntry again with something different").multilineTextAlignment(.center)
                            Spacer()
                        }
                    } else {
                        ScrollView(.vertical) {
                            ForEach(currentSearchedNews, id: \.self) { article in
                                ArticleCardView(urlToImage: article.urlToImage ?? "", title: article.title ?? "", description: article.articleDescription ?? "", isAdded: false, url: article.url, didTapSaveArticle: {
                                    let note = Note(title: article.title ?? "", url: article.url, urlImage: article.urlToImage ?? "", description: article.articleDescription ?? "", language: searchNewsViewModel.currentSelectedLanguage)
                                    noteListViewModel.add(note)
                                })
                            }
                        }
                    }
                } else {
                    VStack(alignment: .center)  {
                        Spacer()
                        LottieView(name: "sunny").frame(height: 200)
                        Text("Try to find something new today!")
                        Spacer()
                    }
                }
            }
        }.padding(.horizontal, 10).padding(.bottom, 40)
    }
}

struct NewsColletion_Previews: PreviewProvider {
    static var previews: some View {
        NewsColletion()
    }
}
