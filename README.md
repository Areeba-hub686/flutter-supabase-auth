<p align="center">
  <img src="assets/banner.png" alt="Flutter Supabase Authentication App Banner" width="100%">
</p>

<h1 align="center">🔐 Flutter Supabase Authentication App</h1>

<p align="center">
A modern authentication application built with <strong>Flutter</strong> and <strong>Supabase</strong>, featuring secure email/password authentication, cloud database integration, persistent sessions, and a clean Material Design interface.
</p>

<p align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-Backend-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Material Design](https://img.shields.io/badge/Material-Design-757575?style=for-the-badge&logo=materialdesign&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

</p>

---

# ✨ Overview

Flutter Supabase Authentication App is a complete authentication solution that demonstrates modern mobile app development using Flutter and Supabase.

The application provides a secure authentication workflow with user registration, login, persistent sessions, profile management, and cloud database integration while following clean UI principles.

---

# 🚀 Features

### 🔐 Authentication

- Secure Email & Password Authentication
- User Registration
- User Login
- Persistent Login Sessions
- Secure Logout

### 👤 User Profile

- Display User Name
- Display Email Address
- Fetch Profile Data from Database
- Dynamic Profile Avatar

### ☁️ Cloud Database

- Store User Information
- Retrieve User Information
- PostgreSQL Database
- Row Level Security (RLS)

### 🎨 User Interface

- Modern Material Design
- Responsive Layout
- Beautiful Gradient UI
- Form Validation
- Loading Indicators
- Session-based Splash Screen

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Cross-platform UI Development |
| Dart | Programming Language |
| Supabase | Authentication & Backend |
| PostgreSQL | Cloud Database |
| Material Design | UI Framework |

---

# 📦 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter

  supabase_flutter:
  font_awesome_flutter:
```

---

# 📂 Project Structure

```text
lib/
│
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   └── profile_screen.dart
│
└── main.dart
```

---

# 🔄 Authentication Flow

```text
                 Splash Screen
                        │
                        ▼
          Check Existing Session
                │
      ┌─────────┴─────────┐
      │                   │
      ▼                   ▼
 Login Screen        Profile Screen
      │
      ▼
 Signup Screen
      │
      ▼
 Supabase Authentication
      │
      ▼
 Store User Information
      │
      ▼
 Retrieve Profile
      │
      ▼
 Profile Screen
      │
      ▼
 Logout
```

---

# 🗄 Database Schema

### profiles

| Column | Type |
|---------|------|
| id | UUID |
| name | TEXT |
| email | TEXT |

---

# ⚙️ Getting Started

## Clone the Repository

```bash
git clone https://github.com/Areeba-hub686/flutter-supabase-auth.git
```

## Navigate to the Project

```bash
cd flutter-supabase-auth
```

## Install Dependencies

```bash
flutter pub get
```

## Configure Supabase

1. Create a Supabase project.
2. Enable Email Authentication.
3. Create a **profiles** table.
4. Enable Row Level Security (RLS).
5. Create SELECT, INSERT, and UPDATE policies.
6. Add your Supabase URL and Anon Key.

---

## Run the Application

```bash
flutter run
```

---

# 🎯 What This Project Demonstrates

- Flutter Application Development
- Secure User Authentication
- Cloud Database Integration
- CRUD Operations
- Session Management
- Form Validation
- Asynchronous Programming
- Navigation Between Screens
- Material Design Principles
- Responsive UI Development

---

# 📚 Learning Outcomes

Through this project, I gained practical experience with:

- Flutter Authentication
- Supabase Backend Services
- PostgreSQL Database
- Stateful Widget Management
- RESTful Backend Integration
- User Session Handling
- Clean UI Design
- Flutter Navigation
- Form Validation
- Database Security with RLS

---

# 👩‍💻 Author

## Areeba Fatima

**GitHub**

https://github.com/Areeba-hub686
