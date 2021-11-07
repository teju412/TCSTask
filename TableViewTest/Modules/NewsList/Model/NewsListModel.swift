//
//  NytSearchModel.swift
//  ReactivePrograming
//  Created by TejaDanasvi on 6/10/21.
//

import Foundation

struct NewsApiResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsApiArticle]?
}

struct  NewsApiArticle: Codable {
    let title: String?
    let description: String?
    let urlToImage: String?
}
