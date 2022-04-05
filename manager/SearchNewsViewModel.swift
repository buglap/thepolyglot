//
//  SearchNewsViewModel.swift
//  manager
//
//  Created by Jenny escobar on 13/12/21.
//

import Foundation
 
class SearchNewsViewModel: ObservableObject {
    @Published var currentSearchText: String = ""
    @Published var availableLanguages: [String]
    @Published var currentSelectedLanguageIndex: Int = 1
    @Published var currentSelectedLanguage: String = "English"
    @Published var currentSearchedNews: News?
    @Published var didSearchFail: Bool = false
    @Published var isLoadingSearch: Bool = false
    static let shared = SearchNewsViewModel()
    let languages: [String:String] = ["العربية":"ar","Deutsch":"de","English":"en","Español":"es","français":"fr","עברית":"he","Italiano":"it","Nederlands":"nl","Norsk":"no","Português":"pt","русский":"ru","中文":"zh"]
    private let newsServices: NewsServiceProtocol
    
    init(newsService: NewsServiceProtocol = NewsService()){
        self.availableLanguages = Array(languages.keys.sorted())
        self.newsServices = newsService
    }

    func searchNews(){
        isLoadingSearch = true
        newsServices.getNewsSearch(textToSearch: currentSearchText.replacingOccurrences(of: " ", with: ""), targetLanguage: getLanguageCode()) { [weak self] results in
            switch results {
            case .success(let news):
                self?.currentSearchedNews = news
                self?.isLoadingSearch = false
                if (news.articles?.count ?? 0) < 1 {
                    self?.didSearchFail = true
                } else {
                    self?.didSearchFail = false
                }
            case .failure(_):
                self?.isLoadingSearch = false
                self?.didSearchFail = true
            }
        }
    }

    func getLanguageCode() -> String {
        return languages[currentSelectedLanguage] ?? "en"
    }

}

