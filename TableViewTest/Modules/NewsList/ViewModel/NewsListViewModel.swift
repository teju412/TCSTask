//
//  NYTListModel.swift
//  ReactivePrograming
//
//  Created by TejaDanasvi on 6/10/21.
//

import Foundation
class NewsListViewModel {
    
    // MARK: - Propeties
    
    var newsArticles = Observer(value: [NewsApiArticle]())
    
    var pageSize = 20
    
    var currentPage = 1
    
    var newCount: Int {
        return newsArticles.value?.count ?? 0
    }
    
    // MARK: - Functions
    
    func resetPage(onComplete: @escaping() -> (Void)) {
        currentPage = 1
        self.newsArticles.value = []
        fetchData() {
            onComplete()
        }
    }
    
    // MARK: - Api Calls
    
    func fetchData(onComplete: @escaping() -> (Void)) {
        NewsApi.getNewsItems(pageSize: self.pageSize, page: self.currentPage, apiKey: Secrets.newsApiKey) { obj in
            let dataResponse = obj?.articles
            self.newsArticles.value! += dataResponse ?? []
            self.currentPage += 1
            onComplete()
        }
    }
}
