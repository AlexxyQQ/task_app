# Flutter Listing and Detail Showcase Application

## Overview

This application is a simple listing and detail showcase built using Flutter, leveraging the JSONPlaceholder API. The app provides the following features:

- Lists all posts fetched from JSONPlaceholder.
- Displays detailed information about each post, including user details and comments.
- Allows users to add comments to a post.
- Displays user details, including their albums and photos.

## Features

1. **Post Listing Screen**

   - Fetches and displays a list of posts from the API.
   - Shows the username of the user who posted the post.

2. **Post Detail Screen**

   - Displays detailed information about a selected post.
   - Lists comments associated with the post.
   - Provides a bottom sheet for adding a new comment.

3. **User Detail Screen**
   - Shows detailed information about a selected user.
   - Displays the user's albums and photos.

## External Libraries and Tools

- **[Flutter Genius Extension](https://marketplace.visualstudio.com/items?itemName=AlexxyQQ.flutter-genius)**: Created by me, it helps write boilerplate code efficiently.
- **[User Dart Class Converter](https://marketplace.visualstudio.com/items?itemName=ricardo-emerson.dart-data-class-tools)**: Used to create Dart classes easily.

## Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  hive_flutter: ^1.1.0
  dio: ^5.5.0+1
  dartz: ^0.10.1
  flutter_bloc: ^8.1.6
  get_it: ^7.7.0
  connectivity_plus: ^6.0.3
  flutter_screenutil: ^5.9.3
  flutter_svg: ^2.0.10+1
  flutter_localization: ^0.2.0
  intl: ^0.18.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  hive_generator: ^2.0.1
  build_runner: ^2.4.9
  flutter_gen: ^5.6.0
  pretty_dio_logger: ^1.3.1
```

## Screenshots

### Post Listing and Post Long Press

<img src="screenshopts\post.png" alt="Post Listing" width="300"/> <img src="screenshopts\long_press_on_post.png" alt="Post Long Press" width="300"/>

### Post Search and Post Detail

<img src="screenshopts\post_search.png" alt="Post Search" width="300"/> <img src="screenshopts\post_detail.png" alt="Post Detail" width="300"/>

### Post Comment and Writing Comment

<img src="screenshopts\comment.png" alt="Post Comment" width="300"/> <img src="screenshopts\writing_comment.png" alt="Writing Comment" width="300"/>

### Comment Posted and User Detail

<img src="screenshopts\comment_posted.png" alt="Comment Posted" width="300"/> <img src="screenshopts\user_details.png" alt="User Detail" width="300"/>

## Getting Started

### Prerequisites

Ensure you have the following installed on your local development environment:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/Download)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/AlexxyQQ/task_app.git
   cd task_app
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```
