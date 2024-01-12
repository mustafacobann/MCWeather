
![github-readme](https://github.com/mustafacobann/MCWeather/assets/22526834/ae902d57-2923-4449-97dd-8af714569c91)

An iOS application that shows weather information for the selected location.

## Requirements
- iOS 17.0

## How to run
This application uses OpenWeather's One Call API (https://openweathermap.org/api/one-call-api).  
This API requires an API key.  
1) Create an open weather account and get an API key
2) Go to the project directory and create a new struct file in the following format:
```swift
import Foundation

enum Secrets {
    static let apiKey = "YOUR_API_KEY_HERE"
}
```
3) Run the app

## Tech Stack
* **SwiftUI:** The application was built with SwiftUI.
* **Combine:** Asynchronous operation are handled via Combine.
* **MVVM:** The application was developed with MVVM architecture in mind.
* **Unit Tests:** Unit tests were written for both the service and the view model.

## Libraries
No dependency was used in the application.
