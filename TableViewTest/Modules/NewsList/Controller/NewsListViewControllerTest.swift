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
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        apiService = nil
        viewModel = nil
        viewController = nil
    }
    
    func test_NumberOfRowsInSection() {
        apiService.getNewsItemResponse = GetNewsItemResponse.success
        XCTAssertEqual(self.viewController.tableView(self.viewController.myTableView, numberOfRowsInSection: 0),3)
    }
    
    func test_cellForRowAtIndexPath() {
        apiService.getNewsItemResponse = GetNewsItemResponse.success
        let cellOne = self.viewController.tableView(self.viewController.myTableView, cellForRowAt: IndexPath(item:0, section:0)) as! NewsListTableViewCell
        let cellTwo = self.viewController.tableView(self.viewController.myTableView, cellForRowAt: IndexPath(item:1, section:0)) as! NewsListTableViewCell
        let cellThree = self.viewController.tableView(self.viewController.myTableView, cellForRowAt: IndexPath(item:2, section:0)) as! NewsListTableViewCell
        XCTAssertEqual(cellOne.titleNameLbl.text,"title1")
        XCTAssertEqual(cellTwo.titleNameLbl.text,"title2")
        XCTAssertEqual(cellThree.titleNameLbl.text,"title3")
        
    }
    
    func test_headingLabel() {
        apiService.getNewsItemResponse = GetNewsItemResponse.success
        XCTAssertEqual(self.viewController.title,"News Feed")
    }
}
