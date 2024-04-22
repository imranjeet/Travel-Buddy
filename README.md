# Travel Buddy App

## Overview
The Travel Buddy app helps users share their travel plans and find duty-free deals along their route. This document provides an overview of the app's functionalities, architecture, and implementation details.

## Features
- **Create a Post:** Users can share their travel plans by entering details such as origin airport, destination airport, travel date, and weight allowance.
- **View Available Travel Routes:** Users can view a list of available travel routes posted by other users, including origin, destination, and travel date.

## App Structure
The app is structured into several components:
1. **Main:** Contains the main entry point of the app and sets up the provider for state management.
2. **Screens:** Includes the screens for creating a post (`create_post_screen.dart`) and listing available travel routes (`post_listing_screen.dart`).
3. **Providers:** Manages the app's state and handles data operations. The `post_provider.dart` file manages posts and integrates with Firebase Firestore.
4. **Models:** Defines the data models used in the app. The `post.dart` file represents a travel post.

## State Management
The app uses the Provider package for state management. It allows us to efficiently manage and update the app's state, ensuring a smooth user experience.

## Firebase Integration
The app integrates with Firebase Firestore for data storage. When a user submits a post, the data is saved to Firestore. The `post_provider.dart` file handles interactions with Firestore, including adding new posts and fetching existing ones.

## Twist - Weight Calculation
In the "Create a Post" screen, users can input their weight allowance in the format "5kg". We parse this input to extract the numeric portion and store it separately in Firestore as the "availableWeight" field. This functionality is implemented in the `create_post_screen.dart` file.

## Flutter Best Practices
- Use of appropriate widgets: The app utilizes Flutter's built-in widgets for creating a user-friendly interface.
- Modular code organization: Each component of the app is organized into separate files, promoting code reusability and maintainability.

## Future Enhancements
- User authentication: Implement user authentication to allow users to sign in and manage their posts.
- Enhanced UI: Improve the user interface with animations and visual enhancements.
- Search functionality: Add search functionality to allow users to find specific travel routes easily.
