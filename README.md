# Overview

As a software engineer, my goal with this project was to improve my skills in the integration of a cross-platform framework like Flutter with a robust backend-as-a-service provider to create a high-performance and responsive web application. I focused on implementing clean architecture patterns, such as separating data fetching into repositories and creating reusable UI layouts, to further my understanding of scalable web development.

This web application is the official companion site for the game *MergeOnslaught*. It provides a centralized hub where players can view current game rankings and learn more about the title. To start a test server on your computer, ensure the Flutter SDK is installed and run the command `flutter run -d chrome` from the project root. Once the compilation is complete, a Chrome window will automatically open to `http://localhost:<port>` (usually 8080) to display the home page.

The purpose of writing this software was to bridge the gap between a standalone game and those who enjoy climbing up the leaderboard by providing a live, data-driven web app with Supabase database integration. It served as a practical application for handling asynchronous data streams, implementing real-time search filtering, and designing a theme-consistent user interface.

[Software Demo Video](http://youtube.link.goes.here)

# Web Pages

The web app consists of two primary pages, with transitions managed by a custom `NavBar` widget that uses instant navigation to mimic a traditional website experience:

* **Home Page**: This serves as the landing page, featuring a large hero banner with a gameplay GIF and a "Play Now" Call-to-Action (CTA). It also includes a game information section with responsive screenshot grids.
* **Leaderboard Page**: This page dynamically fetches the top 50 players from a Supabase database. It features a dynamic ranking table where the top three players receive metallic gold, silver, or bronze styling.
* **Dynamic Elements**: On the Leaderboard page, the player list is created dynamically based on the database response. A real-time search bar allows users to filter this list instantly without additional server calls.

# Development Environment

I used the following tools to develop the software:
* **Flutter SDK**: The primary framework for building the web application.
* **Supabase**: Used as the backend database for storing and retrieving player scores.
* **Firebase Hosting**: Configured for deploying the production web build.
* **Visual Studio Code**: Used as the primary Integrated Development Environment (IDE).

I utilized the Dart programming language along with several key libraries:
* **supabase_flutter**: For database interaction.
* **google_fonts**: To implement custom typography like "Oswald" and "Inter".
* **url_launcher**: To handle external links to the game and social media.

# Useful Websites

* [Flutter Documentation](https://docs.flutter.dev/)
* [Supabase](https://supabase.com/docs)
* [Google Fonts](https://pub.dev/packages/google_fonts)

# Future Work

* **User Authentication**: Implement a login system to allow players to manage their own profiles and display their personal rank.
* **Live Updates**: Transition from one-time data fetching to real-time streams so the leaderboard updates automatically as scores are submitted.
* **Enhanced Statistics**: Expand the `Entry` model to include more detailed player stats, such as total enemies defeated or time survived.