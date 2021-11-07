//
//  ListTableViewCell.swift
//  TableViewTest
//
//  Created by TejaDanasvi on 5/11/21.
//

import UIKit
class NewsListViewController: UIViewController {
    
    // MARK: - Propeties
    var myTableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    // MARK: - Dependency
    let viewModel: NewsListViewModel
    
    // MARK: - Lifecycle
    init(viewModel: NewsListViewModel = NewsListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setupRefresh()
        self.title = "News Feed"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Setup
    func setTableView() {
        myTableView.frame = self.view.frame
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorColor = UIColor.clear
        myTableView.estimatedRowHeight = 120
        self.view.addSubview(myTableView)
        myTableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: "Cell")
        addObservor()
        viewModel.fetchData {}
    }
    
    func addObservor() {
        viewModel.newsArticles.addObserver { _ in
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }
    
    // MARK: - Refresh
    func setupRefresh() {
        myTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(onPullRefresh), for: .valueChanged)
    }
    
    @objc func onPullRefresh() {
        self.viewModel.resetPage() {
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }
    }
}

// MARK: - TableView Delegate
extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewsListTableViewCell else {fatalError("Unabel to create cell")}
        cell.configure(data: (viewModel.newsArticles.value?[indexPath.row])!)
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let scrollViewCanScrollDown = contentOffsetY > scrollView.bounds.height
        let scrollViewIsAtBottom = (contentOffsetY >= (scrollView.contentSize.height - scrollView.bounds.height - 20))
        
        if scrollViewIsAtBottom && scrollViewCanScrollDown {
            DispatchQueue.main.async {
                self.viewModel.fetchData {}
            }
        }
    }
}
