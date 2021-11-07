# Contents
- [Features](#features)
- [FolderStructure](#folder-structure)
- [ScreenShots](#screenshots)
- [Test coverage](#test-coverage)


# Features
- Load table of news articles from API - [Link to API](https://newsapi.org/)
- Pull to Refresh
- Pagination on scroll down of articles


# Folder Structure

```
TableViewTest
├─ Modules
│  └─ NewsList
│     ├─ Model
│     │  └─ NewsListModel
│     ├─ Views
│     │  └─ NewsListTableViewCell
│     ├─ ViewModel
│     │  ├─ NewsListViewModel
│     │  └─ NewsListViewModelTest
│     └─ Controller
│        ├─ NewsListViewController
│        └─ NewsListViewControllerTest
└─ Library
   ├─ Constants
   │  └─ Secrets
   ├─ Extensions
   │  └─ UIImageViewExtension
   ├─ ApiRepository
   │  ├─ NewsApiRepository
   │  │  ├─ NewsApiRepository
   │  │  └─ MockNewsApiRepository
   │  └─ ApiUrl
   └─ Util
      ├─ Request
      └─ Observer
```

# Screenshots

<img src="./images/TCS.gif" width="300px" height="600px"/>


# Test Coverage

<img src="./images/TCS Test Coverage.png" width="750px" height="300px"/>