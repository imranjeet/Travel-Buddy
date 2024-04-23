# Travel Buddy App

## Overview
The Travel Buddy app helps users share their travel plans and find duty-free deals along their route. This document provides an overview of the app's functionalities, architecture, and implementation details.

## Download
https://drive.google.com/file/d/1Rnkir_3RaigtKHD-4JG4pzMv9RO1-O-3/view?usp=sharing

## Features
- **Create a Post:** Users can share their travel plans by entering details such as origin airport, destination airport, travel date, and weight allowance.
- **View Available Travel Routes:** Users can view a list of available travel routes posted by other users, including origin, destination, and travel date.

## App Structure
The app is structured into several components:
1. **Main:** Contains the main entry point of the app and sets up the provider for state management.
2. **Views:** Includes the screens for creating a post (`create_post_screen.dart`) and listing available travel routes (`post_listing_screen.dart`).
3. **Providers:** Manages the app's state and handles data operations. The `post_provider.dart` file manages posts and integrates with Firebase Firestore.
4. **Models:** Defines the data models used in the app. The `post.dart` file represents a travel post.

## State Management
The app uses the Provider package for state management. It allows us to efficiently manage and update the app's state, ensuring a smooth user experience.

## Firebase Integration
The app integrates with Firebase Firestore for data storage. When a user submits a post, the data is saved to Firestore. The `post_provider.dart` file handles interactions with Firestore, including adding new posts and fetching existing ones.

## Weight
In the "Create a Post" screen, users can input their weight allowance in the format "5kg". We parse this input to extract the numeric portion and store it separately in Firestore as the "availableWeight" field. This functionality is implemented in the `create_post_screen.dart` file.

### Some Screenshots
<img src="https://github.com/imranjeet/Travel-Buddy/assets/48348342/6ce4bab1-9708-45ea-b2d6-a318f1cd7f0b" alt="1" width="200" style="margin-right: 10px;"/>
<img src="https://github.com/imranjeet/Travel-Buddy/assets/48348342/4ba1b2dc-9045-44c5-a2dd-410c49eb7dab" alt="2" width="200" style="margin-right: 10px;"/>
