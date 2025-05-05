# ecommerce_app_login

A new Flutter project with login, signup, profile update features, and local data storage.

## Overview

This Flutter application provides basic user authentication (login and signup) and profile management functionalities. Users can update their personal information, including:

* First Name
* Last Name
* Email (pre-filled from signup)
* Phone Number
* Mailing Address
* Profile Picture

The application utilizes a local SQLite database (via `sqflite`) to store user data and profile information. Unit tests have been implemented using `sqflite_common_ffi` for database-related functionalities. Placeholder images are included, and the project incorporates various utility packages for network requests, local storage, image handling, and more.

## Key Features

* **Login and Signup:** Secure user authentication to access the application.
* **Profile Update:** Allows users to modify their personal details and profile picture.
* **Local Data Storage:** Utilizes SQLite (`sqflite`) for persistent storage of user profiles.
* **Image Handling:** Supports displaying network images (`cached_network_image`), SVG images (`flutter_svg`), and image compression (`flutter_image_compress`).
* **Asynchronous Operations:** Leverages `http` for network requests and `url_launcher` for opening URLs.
* **State Management:** Implements `flutter_bloc` and `bloc` for managing application state.
* **Form Validation:** Includes validation for user input in login, signup, and profile update forms.
* **Unit Testing:** Comprehensive unit tests for database interactions using `sqflite_common_ffi`.

## Getting Started

To run this Flutter project on your local machine, follow these steps:

1.  **Prerequisites:**
    * Flutter SDK installed on your system. You can find installation instructions on the official Flutter website: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
    * Android Studio or Xcode (depending on your target platform) for running emulators/simulators or connecting physical devices.

2.  **Clone the Repository:**
    ```bash
    git clone https://github.com/jinosh05/ecommerce_app_login
    cd ecommerce_app_login
    ```
    

3.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```
    This command will download all the necessary packages listed in the `pubspec.yaml` file.

4.  **Run the Application:**
    Choose your target platform (Android or iOS) and run the corresponding command:

    * **Android:**
        ```bash
        flutter run -d <device_id or emulator_name>
        ```
        You can list available devices/emulators using `flutter devices`.

    * **iOS:**
        ```bash
        flutter run -d <device_id or simulator_name>
        ```
        Make sure you have Xcode set up correctly for iOS development.

## Running Unit Tests

This project includes unit tests, particularly for the local database functionality. To run these tests, use the following command:

```bash
flutter test
```

This command will execute all the test files located in the test directory of your project, including those utilizing sqflite_common_ffi. The test results will be displayed in your terminal.

