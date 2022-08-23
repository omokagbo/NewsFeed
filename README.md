# NewsFeed

News feed is an app that fetches top news headline from an api, displays the news to users and lets them select any of the headlines to see read the news

# Requirements
- iOS ~> 13.-
- Xcode ~> 13 (9.3 compatible)
- Swift ~> 5.0

# Installation
- Clone the repository
```sh
$ git clone https://github.com/omokagbo/NewsFeed.git
$ cd NewsFeed
```

- Open the file `NewsFeed.xcodeproj` using Xcode and allow xcode to resolve the project.
- Click on the play button at the top left corner to build and run the project

# Architecture
For this project I made use of an MVVM with Repository Pattern, using depedency injection to ensure separation of concerns and proper decoupling of code around the application. I also made use of the coordinator pattern to manager the navigation flow around the app

# Performance Improvement
- Image caching, this saves the user's time and data
- Caching of news feed to still allow users to see headlines when there is no internet connection
- Activity indicators that allow the user to know what is happening

# Screenshots

<img width="200" alt="News List" src="https://user-images.githubusercontent.com/69020285/186122643-a3767a38-e255-4ae1-943e-f13a2bddc3d1.png"> <img width="200" alt="News Details" src="https://user-images.githubusercontent.com/69020285/186123076-6e5a9ff2-36fa-41ca-917a-f552379f3753.png">

