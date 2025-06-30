# Daily Agenda - Flutter App

## Description

This Flutter app simulates a **Daily Agenda** screen as would be seen by a parent in an educational app.  
It demonstrates:

- Clean and responsive UI for mobile and desktop layouts
- State management with `flutter_bloc`
- Filtering events by selected child and category
- Loading child photos from a free API (mocked in tests)
- Well-structured and modular widget design
- Automated widget tests verifying UI rendering and user interactions

---

## Features

- Header with dropdown to select a child or all children
- Displays parent name (Luis López)
- Horizontal scrollable category selector (Feeding, Nap, Activities, Diapers, Notes)
- Shows event cards filtered by selected child and category
- Responsive layout adapting to screen width (mobile and wide/desktop)
- Mock data for children and events
- Widget tests included with mocked network images

---

## Getting Started

### Prerequisites

- Flutter SDK installed ([Flutter installation guide](https://flutter.dev/docs/get-started/install))
- IDE such as VSCode or Android Studio recommended

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/cguzmancode/flutter-daily-agenda.git
   cd flutter-daily-agenda
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app on an emulator or device:
   ```bash
   flutter run
   ```

---

## Testing

This project includes **widget tests** that cover:

- Rendering of key UI elements such as the child dropdown, category buttons, and events list
- Interaction tests such as selecting/deselecting categories
- Network image loading is mocked during tests to avoid external dependencies

To run tests:

```bash
flutter test
```

---

## Project Structure

- `lib/cubit/` - Business logic (Cubit and State classes)
- `lib/data/` - Mock data and models
- `lib/screens/` - Main screens (AgendaScreen and responsive layouts)
- `lib/widgets/` - Reusable widgets (EventCard, CategorySelector, etc.)
- `test/` - Widget and logic tests

---

## Notes

- Network images in tests are mocked with the `network_image_mock` package to avoid HTTP errors.
- The app demonstrates basic but solid Flutter development skills suitable for a junior developer role.
- UI is designed to be clean and adaptable to different screen sizes.

---

## Optional


---

## Repository

https://github.com/cguzmancode/flutter-daily-agenda