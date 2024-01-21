# Flutter Template Repository

Welcome to the Flutter Template Repository! This repository serves as a starting point for your Flutter projects, providing a structured setup and commonly used configurations to kickstart your development.

## Getting Started

### Prerequisites

Make sure you have Flutter and Dart installed on your machine. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

## Install dependencies

```bash
flutter pub get
```

## Run the app

```bash
flutter run
```

## Features

### 1. Project Structure

The repository follows a well-organized project structure, making it easy to navigate and maintain your Flutter app.

```lua
lib/
|-- features/
|   |-- home/
|   |   |-- providers/
|   |   |-- widgets/
|   |   |-- screens/
|   |   |   |-- home_screen.dart
|-- localizations/
|   |-- app_en.arb
|   |-- app_de.arb
|-- shared/
|   |-- extensions/
|   |   |-- context_extensions.dart
|   |-- providers/
|   |   |-- router/
|   |   |   |-- router_provider.dart
|   |   |   |-- router_provider.g.dart
|   |-- models/
|   |   |-- user/
|   |   |   |-- user.dart
|   |   |   |-- user.freezed.dart
|   |   |   |-- user.g.dart
|   |-- utils/
|   |   |-- widgets/
|   |   |   |-- custom_button.dart
|   |-- services/
|   |   |-- auth_service.dart
|-- main.dart
|-- app_entry.dart
```

### 2. State Management

We use Riverpod for state management. The initial setup includes a basic example to get you started. Feel free to replace it with your preferred state management solution.

### 3. Theming

The project includes a basic theme setup with customizable colors and fonts. You can easily extend it to match your app's design.

### 4. Custom Widgets

A collection of commonly used custom widgets like loading skeletons is provided in the `shared/utils/widgets` directory. Feel free to expand this collection based on your project's needs.

### 5. Code generation

For both riverpod and freezed we use code generation via `build_runner`. This makes it way easier and faster to get all the boilerplate code for your providers or your json serializable and immutable models.
See [models](/lib/shared/models) or [providers](/lib/shared/providers) directory

## VSCode Extensions & Convenience

Flutter wouldn't be so chill without all the extensions and IDE convenience settings. In order to get the best out of it copy all or some of my preferred settings from [vscode.settings](.vscode.settings.json).

I recommend the following extensions:

### General

- error lens
- vscode-icons
- Better Comments
- Color Highlight
- markdownlint
- Path Intellisense
- indent-rainbow

### Flutter specific

- Flutter stylizer
- Freezed
- Flutter Widget Snippets
- Flutter Riverpod Snippets
- Awesome Flutter Snippets
- Pubspec Assist
- Build Runner

## Roadmap & TODOs

I want to add / update the following in the near future:

- Add more useful widgets
- Add a generic oauth client
- Add biometric authentication

## Contributing

Contributions are welcome! If you have suggestions, bug reports, or new features to add, please open an issue or create a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

Happy coding!
