# AuthDemo

A simple Swift iOS app developed in XCode demonstrating Firebase Email/Password authentication in an MVVM architecture.

## Features

- **Login** with email & password  
- **Sign Up** with email, password & confirm-password  
- **Logout**  

## Architecture

- **Model**: `AuthenticationService` (talks to Firebase Auth)  
- **ViewModel**: `AuthViewModel` (holds all UI state & binds to Views)  
- **Views**: `ContentView`, `LoginView`, `SignUpView`, `WelcomeView`  

## Screenshots

<img src="https://github.com/user-attachments/assets/54088f05-bd98-489f-bc30-ad8a27607159" width="150" alt="Login Screen"/>
<img src="https://github.com/user-attachments/assets/36ae72b7-12b7-4f01-ac52-f57ca7ce3480" width="150" alt="Sign Up Screen"/>
<img src="https://github.com/user-attachments/assets/b209ecc4-3999-49a6-bd39-021f8de49435" width="150" alt="Error Message"/>
<img src="https://github.com/user-attachments/assets/3068a3c7-62cb-4e11-aa8d-d44cd7aebe82" width="150" alt="Welcome Screen"/>
