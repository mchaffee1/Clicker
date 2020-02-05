# Clicker

This is a super small "clicker" application that just increments a counter each time the user taps the screen.
It's intended to be the simplest possible demonstration of a couple of good practices in iOS, namely:
- MVVM architecture
- Protocol-oriented everything
- Lightweight dependency injection
- Simple handwritten mocks
- High unit test coverage (achieved through strict TDD)
- Small, bounded integration tests
- Headless functional tests
- Thin UI tests (WIP)

This project uses Cocoapods, but only in order to bring in the handy [WiremockClient library](https://cocoapods.org/pods/WiremockClient) for testing.
This means that after cloning, you'll need to `pod install.`

Additionally, at present the app is hardcoded to see a Wiremock API at localhost:8080.  Obviously in real
life, we'd manage that service address in config, rather than hardcoding.  But this does mean developers
should [install and run Wiremock](http://wiremock.org/docs/getting-started/) on port 8080 for testing.

Please note that there are four schemes: 
- Clicker (containing the application and unit tests)
- Headless Functional Tests
- Integration Tests
- Thin UI Tests

If you see something in this project that could be better, PRs are welcome and thanks in advance!

