# Pokedex

The simplest pokedex app. You can look for over 1000+ pokemons and catch and release them.


<img src="https://raw.githubusercontent.com/mludovico/pokedex_flutter/main/screenshots/pokedex_home.png" alt="Home" width="250"/>
<img src="https://raw.githubusercontent.com/mludovico/pokedex_flutter/main/screenshots/pokedex_search.png" alt="Home" width="250"/>
<img src="https://raw.githubusercontent.com/mludovico/pokedex_flutter/main/screenshots/pokedex_detail.png" alt="Home" width="250"/>

## State management and dependency injection.
This project is based on [MobX](https://pub.dev/packages/mobx) as state management and relies on [GetIt](https://pub.dev/packages/get_it) for dependency injection.

## Architecture
Used references are clean architecture from [#ResoCoder](https://resocoder.com/flutter-clean-architecture-tdd/) and [#Flutterando](https://flutterando.com.br/#/) which separates code in layers as
 - Domain
 - Infrastructure
 - Datasources
 - Presenter

And these layers are created for each feature. Also the services, helpers, etc are kept in different directories outside of the 'app' dir.
The goal is to make it easy to find pieces of code, reduce the coupling and make the code more testable and maintainable.

## UI
The UI follows MVVM pattern using mobx stores to hold the view's states.
Every component is plain Material Design widgets and has a global theme used throughout the app.

## API
The app consumes the open source [PokeAPI](https://pokeapi.co/), a free and funny RESTful API.
There is also a beta GraphQL interface, but for the sake of simplicity the RESTful was used.

## Routing
A `RouteGenerator` was created to provide initial and runtime routes to the app. It is ready to use deeplinks to acecess content within the app with the schema pokedex://.

## Tests
This app uses [Mockito](https://pub.dev/packages/mockito) along with [build_runner](https://pub.dev/packages/build_runner)
to generate the mocked classes.

## HTTP
Though the api is open and do not require authentication, the [Dio](https://pub.dev/packages/dio)
package was used as it provides lots of easy to use methods and features like interceptors, status code validation, etc.

## Local storage
For persisting data of caught pokemons the lib [SharedPreferences](https://pub.dev/packages/shared_preferences) was used.
It only stores the caught pokemons ids and recover this list when building the list and details pages.

### Next Steps
I believe in software products life long improvement. Everything in design and code would never reach perfection.
This app is really simple and so has many low depth solutions. Taking some points in evidence:

 - Improve tests

Add more unity tests, add integration and widget tests.

 - Embrace animations

Use of animations enhances the UX, with the right balance of visual effects and performance is possible to create really pleasing experiences.

 - Local storage

Use a better solution for storing data, like [Hive](https://pub.dev/packages/hive), [SQLite](https://pub.dev/packages/sqflite)
or even [Firebase](https://firebase.google.com/) which makes data accessible through multiple devices and gives realtime updates using sockets.

