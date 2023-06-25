# Flutter Movies App

![Flutter Movies App](https://github.com/spyhimself/flutter-movies_app/blob/main/assets/images/app_screenshot.png)

This is a Flutter application that allows users to browse and search for movies. It fetches movie data from the [The Movie Database (TMDb) API](https://www.themoviedb.org/documentation/api) and provides various features to explore movies, including popular movies, top-rated movies, and movie details.

## Features

- Browse popular and top-rated movies
- Search for movies by title
- View movie details, including synopsis, release date, and average rating
- Watch movie trailers (if available)
- Bookmark favorite movies for quick access
- Dark mode support
- Responsive design for different screen sizes

## Screenshots

![Screenshot 1](https://github.com/spyhimself/flutter-movies_app/blob/main/assets/images/screenshot1.png)
![Screenshot 2](https://github.com/spyhimself/flutter-movies_app/blob/main/assets/images/screenshot2.png)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/spyhimself/flutter-movies_app.git
```

2. Change into the project directory:

```bash
cd flutter-movies_app
```

3. Install the dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

Make sure you have Flutter installed on your machine and set up for your target platform (iOS or Android) before running the app.

## Configuration

To run the app successfully, you need to obtain an API key from TMDb. Follow these steps:

1. Visit [The Movie Database (TMDb) website](https://www.themoviedb.org/) and sign up for an account (if you don't have one already).

2. Once signed in, go to your account settings and navigate to the "API" section.

3. Generate a new API key by clicking on the "Request an API Key" button and follow the instructions.

4. Once you have your API key, create a new file in the `lib` directory called `secrets.dart`.

5. In `secrets.dart`, add the following code:

```dart
class Secrets {
  static const String apiKey = 'YOUR_API_KEY';
}
```

Replace `'YOUR_API_KEY'` with your actual TMDb API key.

## Contributing

Contributions are welcome! If you find any issues or want to enhance the app, feel free to submit a pull request. Please make sure to follow the code style conventions and write appropriate tests when applicable.

## License

This project is licensed under the [MIT License](https://github.com/spyhimself/flutter-movies_app/blob/main/LICENSE).

## Acknowledgments

- This app uses the [The Movie Database (TMDb) API](https://www.themoviedb.org/documentation/api) to fetch movie data.
- The app design and UI inspiration come from various sources and community contributions.
- Special thanks to all the contributors and open-source projects that made this app possible.

If you have any questions or need further assistance, please feel free to contact the project maintainer or open an issue on GitHub. Enjoy exploring movies with Flutter Movies App!
