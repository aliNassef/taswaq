# Taswaq

A modern Flutter application for [brief description of what your app does].

## 🚀 Features

### 🛍️ E-commerce Platform
- Browse products with images, prices, and discounts
- Filter and sort products by categories
- Search functionality to find specific products
- View detailed product information and descriptions
- Special offers and promotional sections

### 🛒 Shopping Experience
- Add/remove products to/from cart
- Save favorite items to wishlist
- Secure checkout process
- Order history and tracking
- Multiple payment methods

### 👤 User Account
- User registration and authentication
- Profile management
- Order history and tracking
- Address book management
- Secure payment information storage

### 📱 Mobile-First Design
- Responsive UI for all screen sizes
- Smooth animations and transitions
- Intuitive navigation
- Offline support for browsing
- Push notifications for order updates

### 🛠️ Technical Highlights
- Built with Flutter for cross-platform compatibility
- State management using BLoC pattern
- Clean Architecture principles
- RESTful API integration
- Local data caching



## 🛠️ Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / VS Code / IntelliJ IDEA
- Android SDK / Xcode (for iOS development)
- Git

## 🚀 Getting Started

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/taswaq.git
   cd taswaq
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── main.dart          # Application entry point
├── config/            # Configuration files
├── models/            # Data models
├── screens/           # App screens
├── services/          # Business logic and API calls
├── utils/             # Helper functions and utilities
└── widgets/           # Reusable widgets
```

 
## 📦 Dependencies

### Core & State Management
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) ^8.1.6 - State management using BLoC pattern
- [equatable](https://pub.dev/packages/equatable) ^2.0.5 - Value-based equality
- [dartz](https://pub.dev/packages/dartz) ^0.10.1 - Functional programming
- [get_it](https://pub.dev/packages/get_it) ^8.0.2 - Dependency injection

### UI Components
- [cached_network_image](https://pub.dev/packages/cached_network_image) ^3.4.1 - Cached network images
- [carousel_slider](https://pub.dev/packages/carousel_slider) ^5.0.0 - Image carousel
- [custom_rating_bar](https://pub.dev/packages/custom_rating_bar) ^3.0.0 - Rating widgets
- [flutter_svg](https://pub.dev/packages/flutter_svg) ^2.0.10+1 - SVG rendering
- [intl_phone_field](https://pub.dev/packages/intl_phone_field) ^3.2.0 - Phone number input
- [lottie](https://pub.dev/packages/lottie) ^3.1.3 - Lottie animations
- [persistent_bottom_nav_bar](https://pub.dev/packages/persistent_bottom_nav_bar) ^6.2.1 - Navigation
- [shimmer](https://pub.dev/packages/shimmer) ^3.0.0 - Shimmer effect
- [skeletonizer](https://pub.dev/packages/skeletonizer) ^1.4.2 - Skeleton loading
- [webview_flutter](https://pub.dev/packages/webview_flutter) ^4.10.0 - WebView

### Firebase
- [firebase_core](https://pub.dev/packages/firebase_core) ^2.24.2 - Firebase Core
- [firebase_auth](https://pub.dev/packages/firebase_auth) ^4.16.0 - Authentication
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) ^4.14.0 - Cloud database
- [google_sign_in](https://pub.dev/packages/google_sign_in) ^6.2.1 - Google Sign-In

### Network & API
- [dio](https://pub.dev/packages/dio) ^5.6.0 - HTTP client
- [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger) ^1.4.0 - Request/response logging
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) ^6.0.5 - Network status

### Local Storage & Caching
- [shared_preferences](https://pub.dev/packages/shared_preferences) ^2.3.2 - Key-value storage
- [cached_network_image](https://pub.dev/packages/cached_network_image) ^3.4.1 - Image caching

### UI Helpers & Utils
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) ^5.9.3 - Responsive UI
- [readmore](https://pub.dev/packages/readmore) ^3.0.0 - Expandable text
- [fluttertoast](https://pub.dev/packages/fluttertoast) ^8.2.8 - Toast messages

### Development & Debugging
- [device_preview](https://pub.dev/packages/device_preview) ^1.2.0 - App preview
- [sentry_flutter](https://pub.dev/packages/sentry_flutter) ^8.9.0 - Error tracking

## 🔧 Environment Variables

Create a `.env` file in the root directory with the following content:

```
API_BASE_URL=your_api_url_here
API_KEY=your_api_key_here
```

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
 
