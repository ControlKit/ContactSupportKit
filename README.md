# ContactSupportKit 📱

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-13.0+-blue.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A powerful and customizable component for implementing contact support forms in iOS applications. This kit is designed with MVVM architecture and advanced features.

## ✨ Features

- 🎨 **4 Different UI Styles** - Choose from various style options
- 🔧 **Full Customization** - Customize all UI elements
- 🏗️ **MVVM Architecture** - Clean and maintainable code
- 📱 **iOS 13+ Support** - Compatible with different iOS versions
- 🌐 **Server Integration** - API integration for sending requests
- ⚡ **Easy to Use** - Implementation in just 2 lines of code
- 🎯 **Error Handling** - Success and error message display
- 📦 **Swift Package Manager** - Easy installation and management

## 🚀 Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/ControlKit/ContactSupportKit.git", from: "1.0.0")
]
```

## 📖 Usage

### Simple Approach (2 lines of code)

For quick and easy component usage:

```swift
import ContactSupportKit

class ViewController: UIViewController {
    @IBAction func contactSupportTapped(_ sender: UIButton) {
        let config = ContactSupportServiceConfig(appId: "your-app-id")
        await ContactSupportKit().configure(root: self, config: config)
    }
}
```

### Advanced Approach (Full customization)

For complete control over appearance and behavior:

```swift
import ContactSupportKit

class ViewController: UIViewController {
    @IBAction func contactSupportTapped(_ sender: UIButton) {
        // Create custom configuration
        let customConfig = ContactSupportServiceConfig(
            style: .style2,
            appId: "your-app-id"
        )
        
        // Customize appearance
        customConfig.viewConfig.titleText = "Contact Support"
        customConfig.viewConfig.titleColor = .systemBlue
        customConfig.viewConfig.containerViewBackColor = .systemBackground
        customConfig.viewConfig.contentViewBackColor = .systemGray6
        
        // Customize fields
        customConfig.viewConfig.subjectText = "Subject"
        customConfig.viewConfig.emailText = "Email"
        customConfig.viewConfig.messageText = "Message"
        
        // Customize buttons
        customConfig.viewConfig.sendButtonTitle = "Send"
        customConfig.viewConfig.cancelButtonTitle = "Cancel"
        customConfig.viewConfig.sendButtonBackColor = .systemBlue
        customConfig.viewConfig.sendButtonTitleColor = .white
        
        // Customize messages
        customConfig.viewConfig.successTitle = "Success!"
        customConfig.viewConfig.successMessage = "Your message has been sent successfully."
        customConfig.viewConfig.errorTitle = "Error"
        customConfig.viewConfig.errorMessage = "Failed to send message. Please try again."
        
        // Display component
        await ContactSupportKit().configure(
            root: self,
            modalPresentationStyle: .pageSheet,
            config: customConfig
        )
    }
}
```

## 🎨 Available Styles

The component includes 4 different styles:

- **Style 1**: Default style with yellow and white color scheme
- **Style 2**: Modern style with blue color scheme
- **Style 3**: Minimal style with gray color scheme
- **Style 4**: Dark style with black color scheme

```swift
let config = ContactSupportServiceConfig(
    style: .style2, // Select style
    appId: "your-app-id"
)
```

## 🔧 Advanced Customization

### Font Configuration

```swift
config.viewConfig.titleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
config.viewConfig.subjectLabelFont = UIFont.systemFont(ofSize: 16, weight: .medium)
config.viewConfig.sendButtonFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
```

### Color Configuration

```swift
config.viewConfig.titleColor = .label
config.viewConfig.containerViewBackColor = .systemBackground
config.viewConfig.sendButtonBackColor = .systemBlue
config.viewConfig.sendButtonTitleColor = .white
```

### Border and Corner Radius Configuration

```swift
config.viewConfig.subjectTextFieldBorderWidth = 1.0
config.viewConfig.subjectTextFieldBorderColor = .systemGray3
config.viewConfig.subjectTextFieldRadius = 12.0
```

### Alert Configuration

```swift
config.viewConfig.alertContainerCornerRadius = 16
config.viewConfig.alertSuccessIconColor = .systemGreen
config.viewConfig.alertErrorIconColor = .systemRed
config.viewConfig.alertFadeAnimationDuration = 0.3
```

## 🏗️ Component Architecture

### Overall Structure

```
ContactSupportKit/
├── ContactSupportKit.swift          # Main class and entry point
├── Protocols/
│   ├── ContactSupportable.swift     # Protocol for sending requests
│   └── Actionable.swift            # Protocol for action management
├── ViewModel/
│   └── ContactSupportViewModel.swift # Main ViewModel
├── View/
│   ├── ContactSupportViewController.swift # Main ViewController
│   ├── ContactSupportViewConfig.swift    # UI configuration
│   └── Builder/                          # Different style builders
│       ├── ContactSupportView+Style1.swift
│       ├── ContactSupportView+Style2.swift
│       ├── ContactSupportView+Style3.swift
│       └── ContactSupportView+Style4.swift
├── Service/
│   ├── ContactSupportServiceConfig.swift # Service configuration
│   ├── ContactSupportRequest.swift       # Request model
│   └── ContactSupportResponse.swift      # Response model
└── Helper/
    ├── ContactSupportViewStyle.swift     # Style management
    └── ImageHelper.swift                # Image helpers
```

### Workflow

1. **Start**: User taps the contact support button
2. **Configuration**: Component settings are configured with `ContactSupportServiceConfig`
3. **Display**: `ContactSupportViewController` is displayed with selected style
4. **Input**: User enters required information
5. **Send**: Request is sent through `ContactSupportViewModel`
6. **Result**: Success or error message is displayed

### Main Classes

#### `ContactSupportKit`
Main class that serves as the entry point to the component:
```swift
public class ContactSupportKit {
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: ContactSupportServiceConfig) async
}
```

#### `ContactSupportViewModel`
Manages business logic and service communication:
```swift
public protocol ContactSupportViewModel: ContactSupportable, Actionable {
    var contactSupportService: GenericServiceProtocol { get set }
    var serviceConfig: ContactSupportServiceConfig { get set }
    var response: ContactSupportResponse? { get set }
}
```

#### `ContactSupportViewController`
Manages display and user interaction:
```swift
class ContactSupportViewController: UIViewController, ContactSupportViewDelegate {
    var viewModel: ContactSupportViewModel
    let config: ContactSupportServiceConfig
    weak var delegate: ContactSupportDelegate?
}
```

## 📱 Usage Examples

### Usage in Settings

```swift
class SettingsViewController: UIViewController {
    @IBAction func contactSupportTapped(_ sender: UIButton) {
        let config = ContactSupportServiceConfig(
            style: .style1,
            appId: Bundle.main.bundleIdentifier ?? ""
        )
        
        config.viewConfig.titleText = "Contact Support"
        config.viewConfig.successMessage = "Your message has been received. We'll respond as soon as possible."
        
        await ContactSupportKit().configure(root: self, config: config)
    }
}
```

### Usage in Help Center

```swift
class HelpViewController: UIViewController {
    @IBAction func sendFeedbackTapped(_ sender: UIButton) {
        let config = ContactSupportServiceConfig(
            style: .style3,
            appId: "help-center-app"
        )
        
        config.viewConfig.titleText = "Send Feedback"
        config.viewConfig.subjectText = "Feedback Subject"
        config.viewConfig.messageText = "Feedback Description"
        config.viewConfig.sendButtonTitle = "Send Feedback"
        
        await ContactSupportKit().configure(
            root: self,
            modalPresentationStyle: .formSheet,
            config: config
        )
    }
}
```

## 🔒 Security

- All requests are sent via HTTPS
- Sensitive information is placed in secure headers
- Device UUID is used for unique identification

## 🧪 Testing

```swift
import XCTest
@testable import ContactSupportKit

class ContactSupportKitTests: XCTestCase {
    func testContactSupportConfiguration() {
        let config = ContactSupportServiceConfig(appId: "test-app")
        XCTAssertEqual(config.appId, "test-app")
        XCTAssertEqual(config.sdkVersion, "1.0.0")
    }
}
```

## 📄 License

This project is released under the MIT license. For more details, please read the [LICENSE](LICENSE) file.

## 🤝 Contributing

Your contributions to improving this project are highly valuable. Please:

1. Fork the project
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to your branch (`git push origin feature/amazing-feature`)
5. Create a Pull Request

## 📱 Cross-Platform Support

ContactSupportKit is available for both iOS and Android platforms:

- **iOS**: [ContactSupportKit](https://github.com/ControlKit/ContactSupportKit) - Swift Package Manager
- **Android**: [ContactSupportKit-Android](https://github.com/ControlKit/ContactSupportKit-Android) - Jetpack Compose with Kotlin

The Android version provides similar functionality with:
- Multiple UI styles (FullScreen1, Popover1, Popover2)
- Full customization capabilities
- Jetpack Compose integration
- Same API structure and configuration options

## 📞 Support

If you have questions or issues:

- 🐛 [Report Bug](https://github.com/ControlKit/ContactSupportKit/issues)
- 💡 [Request Feature](https://github.com/ControlKit/ContactSupportKit/issues)
- 📧 Email: your-email@example.com

## 🔄 Changelog

### Version 1.0.0
- Initial release
- 4 different UI styles
- Full customization capabilities
- iOS 13+ support

---

**Made with ❤️ for iOS developers**