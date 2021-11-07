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

![Recording](images/TCS.gif)


# Test Coverage

![Test Coverage](images/TCS-test-coverage.png)