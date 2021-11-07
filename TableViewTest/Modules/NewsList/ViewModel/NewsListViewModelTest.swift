//
//  NewsListViewModelTest.swift
//  TableViewTestTests
//
//  Created by TejaDanasvi on 7/11/21.
//

import XCTest
@testable import TableViewTest

class NewsListViewModelTest: XCTestCase {
    
    var apiService: MockNewsApi!
    var viewModel: NewsListViewModel!

    override func setUp() {
        apiService = MockNewsApi()
        viewModel = NewsListViewModel(apiService: apiService)
    }

    override func tearDown() {
        apiService = nil
        viewModel = nil
    }

    func test_newCount_ifResponseArticlesIsPopulated_thenCorrectCountIsReturned() {
        let expectation = expectation(description: "fetch news api successful")
        apiService.getNewsItemResponse = GetNewsItemResponse.success
        viewModel.fetchData {
            XCTAssertEqual(self.viewModel.newCount,3)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    func test_newCount_ifResponseArticlesIsEmpty_thenCountIsZero() {
        let expectation = expectation(description: "fetch news api successful")
        apiService.getNewsItemResponse = GetNewsItemResponse.empty
        viewModel.fetchData {
            XCTAssertEqual(self.viewModel.newCount,0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    
    func test_resetPage_ifResponseArticlesIsPopulatedAndResetPageTriggered_thenNewsArticleIsEmptyAndCurrentPageIsOne() {
        let expectation = expectation(description: "fetch news api successful")
        apiService.getNewsItemResponse = GetNewsItemResponse.success
        viewModel.fetchData {
            self.viewModel.fetchData {
                self.viewModel.resetPage {
                    XCTAssertEqual(self.viewModel.currentPage,2)
                    XCTAssertEqual(self.viewModel.newsArticles.value!.count,3)
                }
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
    
}
