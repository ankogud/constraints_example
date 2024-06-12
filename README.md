# Constraints Example

This is a simple Flutter project demonstrating responsive design and state management using Provider.

## Features

- Responsive design with two different layouts for wide and narrow screens.
- State management with Provider for a simple registration form.
- Form validation and navigation to a second screen displaying the entered data.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/ankogud/constraints_example.git
    ```
2. Navigate to the project directory:
    ```sh
    cd constraints_example
    ```
3. Install dependencies:
    ```sh
    flutter pub get
    ```

### Running the App

```sh
flutter run


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';
import 'registration_form.dart';

// Main entry point of the application
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()), // State management using Provider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constraints Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Responsive design: different layouts for narrow and wide screens
            if (constraints.maxWidth < 600) {
              return NarrowLayout();
            } else {
              return WideLayout();
            }
          },
        ),
      ),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RegistrationForm(), // Registration form for narrow screens
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RegistrationForm(), // Registration form for wide screens
          ),
        ),
        Expanded(
          child: Center(
            child: Text('Welcome to Registration Form'), // Additional content for wide screens
          ),
        ),
      ],
    );
  }
}
