//
//  News.swift
//  manager
//
//  Created by Jenny escobar on 3/04/22.
//

import Foundation

// MARK: - News
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]?
}

// MARK: - Article
struct Article: Hashable, Decodable {

    let source: Source
    let author, title, articleDescription: String?
    let url: String
    let urlToImage: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, content
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }

    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.url == rhs.url
    }
}

// MARK: - Source
struct Source: Decodable {
    let name: String
}
