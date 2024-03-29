//
//  NewsApiRepository.swift
//  TableViewTest
//
//  Created by TejaDanasvi on 7/11/21.
//

import Foundation

protocol NewsApiProtocol {
    func getNewsItems(pageSize: Int, page: Int, apiKey: String, onComplete: @escaping(NewsApiResponse?) -> Void)
}

class NewsApi: NewsApiProtocol {
    
    func getNewsItems(pageSize: Int, page: Int, apiKey: String, onComplete: @escaping(NewsApiResponse?) -> Void) {
        
        let url = "\(ApiUrls.newsApiUrl)?q=apple&pageSize=\(pageSize)&page=\(page)&apiKey=\(apiKey)"
        
        Request.get(str: url, type: NewsApiResponse.self) { response, error in
            onComplete(response)
        }
    }
}
