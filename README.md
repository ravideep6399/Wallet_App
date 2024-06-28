Wallet App Documentation
Introduction
App Overview
Wallet App is a crypto wallet designed for crypto enthusiasts. It allows users to create an account on a devnet, fetch their balance, transfer balances between wallets, and request airdrops from Solana.

Audience
This documentation is intended for end users, developers, and administrators who will use, contribute to, or maintain the Wallet App.

Requirements
Android: Version capable of running Flutter 3.13.6
iOS: Version capable of running Flutter 3.13.6
Getting Started
Installation
Download the APK: Download Wallet App APK
Install on Android:
Enable installation from unknown sources in the device settings.
Open the downloaded APK file and follow the on-screen instructions.
Install on iOS:
Download the app from the App Store (link provided).
Configuration
No additional configurations are required post-installation.

User Guide
Features
1. Fetching Balance
Fetch the remaining balance in the user's wallet from the backend.

2. Transferring Balance
Transfer a specified amount of money from one wallet to another.

3. Requesting Airdrop
Request an airdrop from Solana to the user's wallet.

Usage Instructions
Fetching Balance
Open the Wallet App.
Navigate to the Balance section.
Tap on "Fetch Balance" to retrieve the current balance from the backend.
Transferring Balance
Open the Wallet App.
Navigate to the Transfer section.
Enter the recipient’s wallet address.
Enter the amount to transfer.
Tap on "Transfer" to send the specified amount.
Requesting Airdrop
Open the Wallet App.
Navigate to the Airdrop section.
Tap on "Request Airdrop" to request an airdrop from Solana.
Troubleshooting
Internal API Errors: Occasionally, the API may return internal errors. This is controlled by the backend services and usually resolves itself. If the issue persists, contact support.
Developer Guide
Architecture Overview
The Wallet App is built using Flutter and follows the MVVM (Model-View-ViewModel) pattern.

Setup for Development
Prerequisites:

Flutter version: 3.13.6
Dart version: 3.1.3
DevTools version: 2.25.0
Clone the Repository:

sh
Copy code
git clone <git@github.com:ravideep6399/Wallet_App.git>
Install Dependencies:

sh
Copy code
flutter pub get
Code Structure
lib/: Contains the main application code.
models/: Data models.
views/: UI components.
viewmodels/: Business logic and state management.
services/: API calls and backend interaction.
API Documentation
APIs used for fetching balance, transferring balance, and requesting airdrop are provided by the employer.

Contribution Guide
Fork the repository.
Create a new branch for your feature or bug fix.
Ensure your code follows the coding standards.
Submit a pull request with a detailed description of your changes.
Deployment Guide
Deployment Instructions
Development:
Use flutter run to start the app on a development server.
Staging and Production:
Use flutter build apk for Android and flutter build ios for iOS to generate release builds.
Scaling and Performance
Optimize API calls and handle exceptions gracefully to ensure smooth performance.
Regularly monitor the backend services and API endpoints for performance issues.
Maintenance
Regularly update dependencies.
Monitor API health and address any backend issues promptly.
Appendices
Glossary
Devnet: Development network for testing.
Airdrop: Distribution of tokens to wallets.
FAQ
Q: What should I do if I encounter an internal API error?
A: This is usually a temporary issue with the backend. Try again later or contact support if the problem persists.
Additional Resources
Flutter Documentation
Solana Documentation
Version History
Changelog
v1.0.0: Initial release with balance fetching, transferring, and airdrop request features.
Release Notes
v1.0.0:
Added support for creating accounts on devnet.
Implemented balance fetching from the backend.
Enabled balance transfers between wallets.
Integrated Solana airdrop request functionality.
