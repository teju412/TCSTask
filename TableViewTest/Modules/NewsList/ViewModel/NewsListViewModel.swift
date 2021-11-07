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
    
    // MARK: - Dependency
    
    let apiService: NewsApiProtocol
    
    // MARK: - Lifecycle
    
    init(apiService: NewsApiProtocol = NewsApi()) {
        self.apiService = apiService
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
        apiService.getNewsItems(pageSize: self.pageSize, page: self.currentPage, apiKey: Secrets.newsApiKey) { obj in
            let dataResponse = obj?.articles
            self.newsArticles.value! += dataResponse ?? []
            self.currentPage += 1
            onComplete()
        }
    }
}
