# SportApp

An iOS app for browsing sports leagues, their teams and their matches. You can save favorite leagues and see them again later.

## Features

- Sports screen with a grid of sports.
- Leagues list for the sport you pick, with a YouTube link for each league.
- League details with upcoming events, latest results and the teams in the league.
- Team details screen.
- Favorite leagues saved on the device with Core Data. They have their own tab.
- Social media links for a league (YouTube, Twitter, Instagram, Facebook) when the API returns them.

## Built with

Swift, UIKit and storyboards, MVVM, Alamofire, SDWebImage, Core Data. Data comes from TheSportsDB (thesportsdb.com), using its free test key.

## Running it

1. Run `pod install`.
2. Open `SportesApp.xcworkspace` in Xcode.
3. Build and run. No API key setup is needed. The deployment target is iOS 13.6.

Final course project from June 2022.
