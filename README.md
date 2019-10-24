# Clicker

This is a super small "clicker" application that increments a counter each time the user taps the screen.
It's intended to be the simplest possible demonstration of a couple of good practices in iOS, namely:
- MVVM architecture
- Protocol-oriented everything
- Lightweight dependency injection
- Simple handwritten mocks
- High unit test coverage (achieved through strict TDD)
- Headless functional tests (well, test)

There are no external libraries or anything; a developer should be able to open the project in Xcode 10+, 
build, and test or run the app.  Please note that there are two schemes: 
- Clicker (containing the application and unit tests)
- Functional Tests (containing the headless functional test)

If you see something in this codebase that could be better, PRs are welcome and thanks in advance!
