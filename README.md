🏢 Axiom Admin Web App

Axiom Admin Web App is a web-based administrative dashboard developed to manage and monitor the Axiom real estate platform.

This module enables administrators to oversee property listings, manage users and service providers, review bookings, and maintain platform operations efficiently.

The application is designed with a structured interface to ensure smooth workflow and centralized control.

🚀 Key Features

🔐 Secure Admin Authentication
👥 User & Service Provider Management
🏘 Property Listing Approval & Management
📄 Delete Properties
📅 Booking Monitoring & Management
🚫 Block / Unblock Users or Providers
🖼 Media Management (Cloudinary Integration)


🛠 Tech Stack

Framework: Flutter Web
Language: Dart
State Management: Bloc
Backend: Firebase
Database: Cloud Firestore
Media Storage: Cloudinary

📂 Project Structure
lib/
│
├── models/        → Data models  
├── services/      → Firebase & API services  
├── controllers/   → Business logic  
├── screens/       → Admin dashboard screens  
├── widgets/       → Reusable UI components  
└── main.dart      → Application entry point  



⚙️ Installation Guide
Clone the repository:
git clone https://github.com/yourusername/axiom-admin-web.git

Navigate into the project:
cd axiom-admin-web

Install dependencies:
flutter pub get

Run in Web Mode:
flutter run -d chrome


Or build for production:

flutter build web

🚀 Future Enhancements

📊 Advanced analytics & reporting
🔔 Real-time notifications
📁 CSV / Excel export functionality
🔐 Role-based access control
📈 Performance optimization
📦 Audit logs for admin activities

👨‍💻 Developer

Abhinav S

Flutter Developer


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
