# E5D Project

## Getting Started

This project is a phone topup app.

<b>Notes</b>: 
   - Because this is a high risky APP that works with money i prefere not save any sensitive information in the storage even tho we can save using an AES encryption in a secured storage but still there is a risk of stealing the keys to manage session if the app is closed there will be no sessionthe user should login again, we might introduce a local timer that checks if the user is performing any action and we increase the session time.

- I had to disable taking screenshots in the main screen where we are having the user and balance info.

## 👟💻 Getting started

To get started, flutter sdk should be installed in your local machine & added to your PATH :

Install Dependencies

```bash
flutter pub get 
```

## 📟 CLI Commands

| Command             | Description                      |
| ------------------- | -------------------------------- |
| 🕹 `flutter run`      | builds the app and runs it               |
| 🕹 `flutter test` | Runs the unit test cases           |
| 🕹 `dart pub run build_runner build --delete-conflicting-outputs`      | generate models and routes     |
| 🕹 `flutter gen-l10n`      | generate localization   |
| 🕹 `flutter build apk`      | generate a release Android APK file , make sure you configured the keys in the local.properties file  |


### 🕸️ Mocking api's 

Checkout this repo : https://github.com/oussaki-dev/mocked-backend 



### 🕸️ Mock server in app configuration
try to use ngrok to create a reverse proxy between the local running mock server 
and the app by running `./ngrok http 3000` 
where 3000 is the port that the api's are exposed from.


### 🕸️ Update the splash_screen.dart , line : 26 to update the api's base url



### 🕸️ Test users

| Username | Password | status | balance |
| -------- | ---------| ------- | ------ |
| user1 | pass1 | verified | 8123.5
| user2 | pass2 | not verified | 5238.5

### The architecture 

    Presentation Layer |  <- ViewModels interact with the Use Cases
------------------------
     Domain Layer      |  <- Contains Use Cases, Entities, and Repository interfaces
------------------------
      Data Layer       |  <- Implements Repository interfaces, handles data sources

<img src="https://i.ibb.co/vPJqX2j/Screenshot-2024-08-01-at-4-50-04-PM.png"  width="300"/>

### Design 

Pallet used : https://colorhunt.co/palette/ef5a6ffff1dbd4bdac536493

### screenshots 

<img src="https://i.ibb.co/HK2r0wn/Screenshot-1722514745.png"  width="300"/>
<img src="https://i.ibb.co/Jt8YvLd/Screenshot-1722514672.png"  width="300"/>
<img src="https://i.ibb.co/wBDD56L/Screenshot-1722514701.png"  width="300"/>
<img src="https://i.ibb.co/M1yRfmF/Screenshot-1722514695.png"  width="300"/>
<img src="https://i.ibb.co/XL94sK6/Screenshot-1722514690.png"  width="300"/>
<img src="https://i.ibb.co/k883Bqp/Screenshot-1722514684.png"  width="300"/>