# Contents
- Features
- FolderStructure
- ScreenShots

---

## Features
- Load table of news articles from API - [Link to API](https://newsapi.org/)
- Pull to Refresh
- Pagination on scroll down of articles

---

## Folder Structure

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

---

## Screenshots