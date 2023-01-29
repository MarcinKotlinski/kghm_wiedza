# KGHM Wiedza

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Mobile application made for KGHM during CuValley Hack 2023

## Getting Started 🚀

## Installation 💻

**❗ In order to start using Home Repository you must have the FLUTTER and DART SDK installed on your machine.**

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
$ dart pub global activate very_good_cli
```

```sh
$ very_good packages get --recursive
```

```sh
# Production
$ flutter run --flavor production --target lib/main_production.dart
```

Dane do logowania w aplikacji:

Login: jury@kghm.com

Haslo: Kghm2023

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
