//
//  MockNewsListViewController.swift
//  TableViewTestTests
//
//  Created by TejaDanasvi on 7/11/21.
//

import XCTest
@testable import TableViewTest

class NewsListViewControllerTest: XCTestCase {

    var apiService: MockNewsApi!
    var viewModel: NewsListViewModel!
    var viewController: NewsListViewController!
    

    override func setUp() {
        apiService = MockNewsApi()
        viewModel = NewsListViewModel(apiService: apiService)
        viewController = NewsListViewController(viewModel: viewModel)
    }

    override func tearDown() {
        apiService = nil
        viewModel = nil
        viewController = nil
    }

    func test_NumberOfRowsInSection() {
        let expectation = expectation(description: "fetch news api successful")
        apiService.getNewsItemResponse = GetNewsItemResponse.success
        viewModel.fetchData {
            XCTAssertEqual(self.viewController.tableView(self.viewController.myTableView, numberOfRowsInSection: 0),3)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
   

}
