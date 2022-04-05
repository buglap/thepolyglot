//
//  NewsService.swift
//  manager
//
//  Created by Jenny escobar on 3/04/22.
//

import Foundation
import SwiftUI
import Alamofire

protocol NewsServiceProtocol {
    func getNewsSearch(textToSearch: String, targetLanguage: String, completion: @escaping (Result<News, Error>) -> Void)
}

final class NewsService: NewsServiceProtocol {
    func getNewsSearch(textToSearch: String, targetLanguage: String, completion: @escaping (Result<News, Error>) -> Void) {
        let request = AF.request("https://newsapi.org/v2/everything?q=\(textToSearch)&language=\(targetLanguage)&apiKey=yournewsapihere")
        request.responseDecodable(of: News.self) { (response) in
            if response.error != nil {
                completion(.failure(response.error!))
            } else {
                if let news = response.value {
                    completion(.success(news))
                }
            }
        }
    }
}
