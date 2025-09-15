# 🚀 Flutter App with Simple SFA API

A Flutter application built with **Flutter 3.29.0**, integrated with backend API provided by the [simple_sfa](https://github.com/KevinAWijaya/simple_sfa.git) repository.

---

## 📦 Requirements

- Flutter SDK 3.29.0
- Dart 3.x
- Android Studio / VS Code with Flutter extensions
- Backend API: simple_sfa (laravel)

---

## ⚙️ Getting Started

1. Clone the repository

   git clone https://github.com/KevinAWijaya/simple_sfa.git  
   cd your-repo

2. Install dependencies

   flutter pub get

3. Configure API Endpoint

   - Update API base URL to point to your simple_sfa backend. (lib/core/services/api_url.dart)

   Example:

   const String baseUrl = "http://localhost:8000/";

4. Run the app

   flutter run

--- 

## 🧩 Features

- Flutter 3.29.0 stable  
- API integration with simple_sfa  
- GetX (state management & routing)
- Custom reusable components  
- Support for Android

---

## 🛠️ Development Notes

- Make sure backend API is running before testing the app.
  
---

## 🤝 Contributing

1. Fork the project  
2. Create your feature branch (`git checkout -b feature/amazing-feature`)  
3. Commit changes (`git commit -m 'Add amazing feature'`)  
4. Push to branch (`git push origin feature/amazing-feature`)  
5. Open a Pull Request  

---

## 📜 License

This project is licensed under my concern
