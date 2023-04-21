<img src="assets/logo.jpg" width="200">

# The Emoroid Digest App

The Emoroid Digest App is a mobile app available on both iOS and Android that users can use to access the
content released by [The Emoroid Digest](https://med.emory.edu/departments/medicine/divisions/digestive-diseases/education/emoroid-digest.html), including both the visual summaries and podcasts.

## Installation Guide

### Pre-requisites

You need an iOS or Android device. The iOS version must be `>= 13.0`. The Andorid device must have Android SDK `>= 21`.

### Download and install

The app is still in beta testing. Will update the instuctions here once the app is available on App Store and Play Store.

### Run the app

First, locate the app icon on your device. For iOS users, you can swipe through your home screen pages or use the App Library to find the app. For Android users, you can browse the app drawer or home screen. Once you find the app icon, simply tap on it to open and launch the app. 

After the app launches, you should see a home screen displaying the latest available visual summary and podcast.

If you have trouble locating the app, you can use the built-in search function on your device: 
- For iOS, swipe down from the middle of the home screen to access Spotlight Search
- For Android, tap on the Google search bar widget or swipe up from the home button (if available) to access the app search. 
Type the app name in the search bar and tap on the app icon when it appears in the search results to launch it.

### Troubleshooting

If the app does not launch properly, or the visual summaries and podcasts do not load correctly, try restarting the app. If this still doesn't work, consider removing the app from your device and reinstall the app again.

If the app still doesn't work as expected, please leave us a comment on App Store and Play Store.

If you encounter any issue at any point while using the App:
1. Click the hamburger icon at the top left of the screen
2. Select the "Feedback" 
3. Fill out the feedback/bug report form 

## Development Guide

The app is written in Flutter. [Follow the instructions here to install Flutter on your device](https://docs.flutter.dev/get-started/install).


Once Flutter is installed, clone this repository to your local machine. Execute `flutter run` at the root of the repository to start the app.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Release Notes

## Version 1.0.0
### New Features
* Add feedback page for users to report feedback or bugs
* Add a page to view visual summaries in fullscreen mode

### Bug Fixes
* Fix the grey screen when the app lanches the first time in release mode
* Adjust UI to accommodate for mobile phones with small screen sizes

### Known Issues 
* Sometimes visual summary thumbnails are not loaded properly when user scoll through a list of visual summary too fast

---

## Version 0.3.0
### New Features
* Log anonymous visual summary view, download, and favorite events to Google Analytics
* Log anonymous visual summary original manuscript click events to Google Analytics
* Log anonymous podcast play events to Google Analytics

### Bug Fixes
* Fix the bug that causes the app failing to load visual summaries and podcasts after fresh install
* Fix podcast detail page back button navigation failure

### Known Issues 
* The screen greys out on when launching the first time in release mode

---

## Version 0.2.0
### New Features
* Browse podcasts based on categories (like medical society, organ systems, keywords, and the year the guideline was released)
* Add podcast detail page and can listen to podcast
* Mark podcasts as listened or un-listened and favorite
* Navigate from visual summaries to associated podcast and the other direction
* Receive notification when new podcasts are available
* A search page for searching both visual summaries and podcasts
* An about page that displays information about The Emoroid Digest App

### Bug Fixes
N/A

### Known Issues 
* The backbutton on podcast detail page does not work 
* Sometimes the app fails to load visual summaries and podcasts after fresh install

---

## Version 0.1.0
### New Features
* Browse visual summaries based on categories (like medical society, organ systems, keywords, and the year the guideline was released)
* Download visual summaries for offline access
* Mark visual summaries as read or unread and favorite
* Navigate to the tweet for a particular visual summary
* Receive notification when new visual summaries are available

### Bug Fixes
N/A

### Known Issues 
N/A

---
