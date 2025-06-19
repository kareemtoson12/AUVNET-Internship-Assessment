# Nawel - Flutter Application

A modern Flutter application that provides food delivery, groceries, and health services. This application follows clean architecture principles and uses BLoC for state management.

## 📱 Features

- User Authentication (Sign Up/Login)
- Food Delivery Service
- Grocery Shopping
- Health Services
- Secure Local Storage
- Beautiful UI with Custom Components
- Firebase Integration

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.7.2)
- Dart SDK (^3.7.2)
- Firebase Account
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone [ https://github.com/kareemtoson12/AUVNET-Internship-Assessment.git]
cd nawel
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Add Android and iOS apps to your Firebase project
   - Download and place the configuration files:
     - Android: `android/app/google-services.json`
     - iOS: Update the Firebase configuration in iOS project settings

4. Run the app:
```bash
flutter run
```

## 🏗️ Architecture Overview

The project follows Clean Architecture principles with the following layers:

### 1. Presentation Layer (`lib/presentation/`)
- **Screens**: UI components and screens
  - Home
  - Login
  - Signup
  - Services (Food, Groceries, Health)
  - Onboarding
- **BLoC**: State management
  - Events
  - Logic
  - States
- **Widgets**: Reusable UI components

### 2. Domain Layer (`lib/domain/`)
- **Models**: Core business objects
- **Repositories**: Abstract repository definitions
- **Use Cases**: Business logic implementation

### 3. Data Layer (`lib/data/`)
- **Data Sources**: Remote and local data sources
- **Repositories**: Concrete repository implementations
- **Services**: Firebase and local storage services

### 4. App Layer (`lib/app/`)
- Application-wide configurations
- Dependency injection
- Theme and styles
- Error handling

## 📦 Dependencies

Key dependencies used in the project:

- **State Management**:
  - `flutter_bloc`: ^9.1.1
  - `equatable`: ^2.0.7

- **Dependency Injection**:
  - `get_it`: ^8.0.3

- **Storage**:
  - `hive`: ^2.2.3
  - `hive_flutter`: ^1.1.0

- **Firebase**:
  - `firebase_auth`: ^5.0.0
  - `firebase_core`: ^3.0.0
  - `cloud_firestore`: ^5.6.9

- **UI Components**:
  - `flutter_svg`: ^2.2.0
  - `shimmer`: ^3.0.0
  - `device_preview`: ^1.1.0

## 🏛️ Project Structure

```
lib/
├── app/                  # App-wide configurations
├── data/                 # Data layer
│   ├── data_source/     # Data sources
│   ├── repository/      # Repository implementations
│   └── services/        # External services
├── domain/              # Business logic layer
│   ├── model/          # Domain models
│   ├── repos/          # Repository interfaces
│   └── usecases/       # Use cases
└── presentation/        # UI layer
    ├── bloc/           # BLoC state management
    ├── routes/         # Navigation
    ├── screens/        # App screens
    └── widgets/        # Shared widgets
```

## 🔐 Security

- Firebase Authentication for user management
- Secure local storage using Hive
- Environment configuration management

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
