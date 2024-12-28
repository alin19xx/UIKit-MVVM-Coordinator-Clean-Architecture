
# UIKit-MVVM-Coordinator-Clean-Architecture

This repository is an iOS app example using **UIKit**, following modern patterns such as **MVVM**, **Coordinator**, and **Clean Architecture**. The app interacts with the **SpaceX API** to fetch real-world data like rockets, launches, landing pads, and satellites.

---

## 📖 Project Overview

The goal of this project is to demonstrate how to build a **modular**, **scalable**, and **testable** iOS app using modern architecture patterns.

### Key Features:
- **Asynchronous operations** using `async/await`.
- **Pagination** for large datasets.
- **Coordinated navigation** with the **Coordinator Pattern**.
- **MVVM Architecture** to ensure a clear separation of concerns.
- **Reusable base classes** for UI and logic components.
- Dynamic **Light/Dark Mode** support.
- Integration with the **SpaceX API** to fetch real-time data.

---

## 🗂 Project Structure

```plaintext
SpaceXplorer/
├── Features/
│   ├── Data/
│   │   ├── Endpoints/
│   │   │   └── SpaceXEndpoint.swift
│   │   └── {FeatureName}/
│   │       ├── Decodables/
│   │       │   └── {FeatureName}Decodable.swift
│   │       └── Repositories/
│   │           └── {FeatureName}Repository.swift
│   │       
│   ├── Domain/
│   │   └── {FeatureName}/
│   │       ├── Entities/
│   │       │   └── {FeatureName}Entity.swift
│   │       └── UseCases/
│   │           └── {FeatureName}UseCase.swift
│   └──  Presentation/
│       ├── Base/
│       ├── Coordinator/
│       │   └── MainCoordinator.swift
│       └── {FeatureName}/
│           ├── View/
│           ├── ViewModel/
│           └── Model/
└── Utils/
    ├── Extensions/
    ├── Logger/
    ├── Network/
    └── Boxing/

```

### Layers Explanation:
1. **Networking**: Handles HTTP requests and image downloads using `URLSession` with error handling and logging.
2. **Data**: Contains repositories to fetch data from the SpaceX API and handle raw data transformations.
3. **Domain**: Implements business logic through **Use Cases** that enforce application rules and interact with repositories.
4. **Presentation**: Manages the UI, including View Controllers, ViewModels, and Coordinators for navigation.
5. **Base Classes**: Provides reusable components like `BaseViewController`, `BaseTableViewCell`, and `BaseViewModel`.
6. **Resources**: Stores assets such as images and colors for Light/Dark Mode.

---

## 🛠 Concepts Used

- **UIKit**: To create a polished user interface.
- **MVVM Architecture**: For separating the UI from business logic.
- **Coordinator Pattern**: For modular and scalable navigation management.
- **Clean Architecture**: To ensure maintainable and testable code through layered architecture.
- **async/await**: For modern, readable asynchronous code handling.
- **URLSession**: For networking tasks.
- **SpaceX API**: To fetch real-world data about launches, rockets, satellites, and landing pads.

---

## ✨ Features and Notes

### 1. Networking
The `NetworkClient` class provides a reusable networking layer with the following features:
- Generic requests using `request<T: Decodable>`.
- Image downloading using `downloadImage(from:)`. (Not used yet)
- Custom error handling through `NetworkError`.
- Request/response logging for debugging and monitoring.

Example usage:
```swift
let networkClient: NetworkClientProtocol = NetworkClient()
let launches: [LaunchModel] = try await networkClient.request(endpoint: SpaceXEndpoint.launches(limit: 10, offset: 0))
```

### 2. Pagination
The project supports efficient pagination, implemented in the **Use Case Layer**. This ensures smooth data loading while reducing redundant API calls.

#### How It Works:
- **State Management**: The `ViewModel` tracks the current state (e.g., loading, idle, or error) to control when data should be fetched.
- **Caching**: Data from previous pages is stored to avoid fetching the same information multiple times.
- **Offset Calculation**: Dynamically calculates the offset to load the next set of data.

### 3. Base Classes
Reusable base classes are implemented to standardize common functionalities:
- **BaseViewController**: Handles spinners, error states, and UI setup.
- **BaseTableViewCell**: Provides reusable table view cell logic.
- **BaseViewModel**: Manages shared logic for ViewModels.

Example: `BaseViewController`
```swift
class BaseViewController<ViewModel: BaseViewModelProtocol>: UIViewController {
    var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }

    func showLoadingSpinner() { /* Show spinner logic */ }
    func hideLoadingSpinner() { /* Hide spinner logic */ }
}
```

### 4. Box for Bindings
This project uses a `Box` class for simple data binding. It helps update the UI when data changes without the need for a more complex reactive framework. Example:
```swift
var name: Box<String> = Box("Initial Value")

name.bind { newValue in
    print("Updated value: \(newValue)")
}

name.value = "New Value"
```

---

## 🚧 To Do:
- Add error handling properly
- Add proper **unit tests** to ensure code reliability.
- Improve **data caching** strategies for better performance.
- Add more **UI-specific logs** to track user interactions.
- Enhance **map views** with better visuals and interactivity.
- Fine-tune the usage of **async/await** for better consistency.
  

---

| <img src="https://github.com/user-attachments/assets/0aa8245e-7eed-4543-9dd2-2d66e237ca03" alt="Simulator Screenshot" width="220"/> | <img src="https://github.com/user-attachments/assets/130f871e-dc47-4f59-8b42-b270c9870bcb" alt="Simulator Screenshot" width="220"/> | <img src="https://github.com/user-attachments/assets/f1f38b3e-d443-49c6-a7bd-874338a5cd5d" alt="Simulator Screenshot" width="220"/> | <img src="https://github.com/user-attachments/assets/3d07bd63-240d-4740-82a9-08a144fbdb10" alt="Simulator Screenshot" width="220"/> |
|:------------------------------------------------------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|
| **HOME**                                                | **ROCKET LIST**                                                | **STARLINK MAP**                                               | **LANDPAD DETAIL**       
