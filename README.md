# Harmonie

<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/app_icon.jpeg" width="250" height="250">

Harmonie is a music streaming application built using Flutter and Firebase.

##### Author & Developer: [Naveenchand](https://github.com/Naveenchand06)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## State Management

### State Management with Custom Generics

This music player app utilizes **Riverpod** for state management. However, to simplify event handling and state updates, I've created custom generics. *These generics mimic the behavior of BLOC, a popular state management pattern*.

### What is BLOC?

BLOC (Business Logic Component) is a state management architecture frequently used in Flutter applications. It revolves around three core states:

**Loading**:  *Indicates that data is being fetched or an operation is in progress.*<br/>
**Error**:    *Signals that an issue has occurred during a process.* <br/>
**Success**:  *Signifies that data or an operation has completed successfully.*<br/>

This custom generics provide a structured approach to managing these three states within your UI. They handle event triggering, state emissions, and state change listening within the UI, similar to how BLOC functions. This approach streamlines state management while remaining readily understandable for those familiar with BLOC.

### Benefits:

- The BLOC-inspired structure makes it easier for developers who have used BLOC previously to adapt and work with this state management system.
- By building custom generics, you can potentially tailor the state management solution to fit the specific needs of your application.

Overall, this approach leverages Riverpod's flexibility while incorporating the intuitive state handling concepts from BLOC, creating a streamlined state management experience for developers.

<br/><br/>

## Reusable Dialogs and Loading

This music player app prioritizes code efficiency through reusable components for dialogs and loading states. By implementing:

**Generic Dialogs**: I've created dialogs that can be easily customized for different purposes within the app. You can specify the title, content, and buttons for each dialog instance, reducing repetitive code.<br/><br/>
**Singleton Loading**: A single "loading" component serves as a central point to display a loading indicator anywhere in the app. This eliminates the need to recreate loading states from scratch, streamlining development and ensuring consistency.<br/><br/>

*This approach allows you to*:
- Minimize Code Duplication: Reuse common dialog and loading functionalities across the app.
- Maintain Consistency: Guarantee a uniform appearance and behavior for dialogs and loading indicators.
- Simplify Development: Focus on the unique content of each dialog without rewriting dialog logic.

## Screenshots

<p float="left">
<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/login.jpeg" width="250" height="500">
<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/loading.jpeg" width="250" height="500">
<img src="https://raw.githubusercontent.com/Naveenchand06/flutter-harmonie/main/assets/showcase/register.jpeg" width="250" height="500">
</p>

<p float="left">
<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/home.jpeg" width="250" height="500">
<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/search.jpeg" width="250" height="500">
<img src="https://raw.githubusercontent.com/Naveenchand06/flutter-harmonie/main/assets/showcase/dialog.jpeg" width="250" height="500">
</p>

<p float="left">
<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/song_1.jpeg" width="250" height="500">
<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/song_2.jpeg" width="250" height="500">
<img src="https://github.com/Naveenchand06/flutter-harmonie/raw/main/assets/showcase/song_3.jpeg" width="250" height="500">
</p>


## Roadmap

- [x] Fetching sing data from Firebase and playing song

- [x]  Play, Pause and Seek feature [x]

- [ ] In app volume control

- [ ] Previous and Next Song option

## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://naveen.tv/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/naveenchand06/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/Naveenchand0606)
