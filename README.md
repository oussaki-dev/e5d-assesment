# E5D Project

## Getting Started

This project is a phone topup app.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


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




### 🕸️ Mocking api's 

| env        | url                                                                                                  |
| ---------- | ---------------------------------------------------------------------------------------------------- |
| BaseUrl | https://myapi.com                               |
| Login     |  |


### 🕸️ Test users

| Username | Password | status | balance |
| -------- | ---------| ------- | ------ |
| user1 | User1p@word | not verified | 300
| user2 | User2p@$$word | verified | 100
| user3 | User3p@$$word | verified | 5000 


### The architecture 

    Presentation Layer |  <- ViewModels interact with the Use Cases
------------------------
     Domain Layer      |  <- Contains Use Cases, Entities, and Repository interfaces
------------------------
      Data Layer       |  <- Implements Repository interfaces, handles data sources

<img src="https://i.ibb.co/VjzXZCQ/Screenshot-2024-07-26-at-4-21-18-PM.png" alt="Flow diagram">



### Design 

Pallet used : https://colorhunt.co/palette/ef5a6ffff1dbd4bdac536493
