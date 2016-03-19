# YoutubeDemo
Introduce about application:

There is application that user can play video from youtube on iphone. How to application work?
- When user opened application we will get all list of video category from Youtube. The UI very simple and easy to use, user can select category by click into "Menu" button.
- Depend on device(iPhone or iPad) we will limit video items display in the first time.
- User can scroll down to load more video 
- To play video user click into video, a player video will be open. I keep the UI of player video because it's very friendly for user and they can easy to control. They can play, pause, forward. 
- When user pressed home button the video still play in background mode automatically.
I attached screenshots on project so you can quickly to review.

About your question
1. Any challenges you faced during the development? If yes explain the same.

Answer:
I have some challenges while i develop to this application.
- Firstly i don't have design file for application, i concern about what should i structure my project? How to design a simple application that have good UX for user. Because your requirements about play youtube video so i review youtube application on my iphone and i make decision. I just have 2 main screens: the first screen will be display list category, second screen will be display list video of category. 

- Second about how to get data from youtube, i don't have experience about youtube data api. Depend on my idea and flow of project, i focus on which api that i need? I search on google developer, stackoverflow. I read document to know about param, i try to review result from google developer website.
+ https://developers.google.com/apis-explorer/#p/youtube/v3/

- Finally about structure of project, i my previous experience i have been worked with slider menu but i have used to some library open source(IIViewDeckController, MMDrawerController). Because application too small so i don't want to integrated many libs so i try to build by my self. I need to manage left menu controller life cycle and add more basic animation. It takes time to build more than use to lib but i try to hard working and the result i can deep know about slider menu and i confidence i can build it.

2. Explain the steps if we are pushing this app to App store.

Answer:
- Test carefully application to make sure application don't crash: follow by test case, unit test, automation test
- Prepare icon for app follow by iOS Human Interface Guidelines
- Prepare image for splash screen, it's display on screen in the first time application run.
- Prepare text description about app, screenshot, video preview if would like to a video preview when use download app on Apple Store.
- Create production certificate type of "App Store and Ad Hoc"
 + Login to website “developer.apple.com”
 + Create a certificate type of product
 + Certificate Signing Request (CSR): create from keychain on mac and store to disk 
 + Upload CSR file to apple
 + Download production certificate and double click to import to mac.
- Create App Id from Apple Dev
 + Enter name of application
 + Enter bundle id you can copy from project on xCode
- Create provisioning profile type of "Distribution"
 + Select appstore option(Create a distribution provisioning profile to submit your app to the App Store.)
 + Select app id of app 
 + Select certificate distribution
 + Download and double click to import to mac
- Login to your account dev on xcode to download all certificate and profile automatically 
- Create a new app on itunes connect
 + Enter correct your info application: name, bundle id, category
 + Enter developer info: address, phone, email...
 + Enter account test of app if have to login 
 + Upload screenshot/video preview
 + Upload icon on itunes connect(1024x1024 size)
- Submit source code to iTunes connect(use xCode to submit)
 + Enter version number
 + Select target iOs Device
 + Select profile's name for build to appstore
 + Select tab Product -> Archive
 + Validate to sure everything is right
 + Click submit to app store
 + Select your dev account
 + Waiting for upload
- Login into iTunes Connect, select file build on iTunes connect
- Check carefully
- Submit for preview

3. Have you used any profiling tool for this project? If yes explain the same.

Answer:
Yes. I have. In application i used some common libs
- CocoaPods: dependency manager for Swift and Objective-C Cocoa projects
- UIScrollView+InfiniteScroll: it's category of scrollview that help handle load more with block.
- AFNetworking: a famous library that handle request to server. Because AFNetworking designed base on NSURLConnection/NSURLSession and combine with GCD/NSOperation/NSOperationQueue. So in this application we can use NSURLConnection/NSURLSession that don't need to use AFNetworking but i added to project because i would like to use "UIImageView+AFNetworking.h" category to load image and caches.
- MBProgressHUD: displays a translucent HUD with an indicator and/or labels while work is being done in a background thread.
- XCDYouTubeKit: help to play video from youtube on ios application. I would like to use this lib more than YTPlayerView because i like UX of it and easy to use. 




