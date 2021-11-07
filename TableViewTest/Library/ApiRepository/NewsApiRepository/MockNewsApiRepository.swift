//
//  MockNewsApiRepository.swift
//  TableViewTestTests
//
//  Created by TejaDanasvi on 7/11/21.
//

import XCTest
@testable import TableViewTest

class MockNewsApi: NewsApiProtocol {
    
    var getNewsItemResponse: NewsApiResponse = GetNewsItemResponse.success
    
    func getNewsItems(pageSize: Int, page: Int, apiKey: String, onComplete: @escaping (NewsApiResponse?) -> Void) {
        onComplete(getNewsItemResponse)
    }
}

struct GetNewsItemResponse {
    static var success = NewsApiResponse(status: nil, totalResults: nil, articles: [
        NewsApiArticle(title: "title1", description: "descrtion1", urlToImage: "urltoimage1"),
        NewsApiArticle(title: "title2", description: "descrtion2", urlToImage: "urltoimage2"),
        NewsApiArticle(title: "title3", description: "descrtion3", urlToImage: "urltoimage3"),
    ])
    static var empty = NewsApiResponse(status: nil, totalResults: nil, articles: [])
}
