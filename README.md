# Valuto

## WIP

Flutter app that works like your bank app.

Backend: [valuto-api](https://github.com/bpotmalnik/valuto-api)

Currently supported: 
- displaying accounts 
- displaying transactions 

<p float="left">
  <img height="500" alt="Home Page" src="https://user-images.githubusercontent.com/20015942/201359302-64e69f51-865c-48bb-a75a-6b13a99b2847.png">
  <img height="500" alt="Accounts Page" src="https://user-images.githubusercontent.com/20015942/201359535-32de2550-d13c-4440-b789-6b91577f743b.png">
  <img height="500" alt="Transactions" src="https://user-images.githubusercontent.com/20015942/201359785-27dde5df-677c-4c5b-afdf-0109c9458e03.png">
</p>

Design:
- [Screenlane MoneyCoach](https://screenlane.com/screen/moneycoach-ios-app-b9f/)

---
## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Valuto works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

