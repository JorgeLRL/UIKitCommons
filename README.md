# UIKitCommons

[![CI Status](https://img.shields.io/travis/luisMan97/UIKitCommons.svg?style=flat)](https://travis-ci.org/luisMan97/UIKitCommons)
[![Version](https://img.shields.io/cocoapods/v/UIKitCommons.svg?style=flat)](https://cocoapods.org/pods/UIKitCommons)
[![License](https://img.shields.io/cocoapods/l/UIKitCommons.svg?style=flat)](https://cocoapods.org/pods/UIKitCommons)
[![Platform](https://img.shields.io/cocoapods/p/UIKitCommons.svg?style=flat)](https://cocoapods.org/pods/UIKitCommons)

UIKitCommons is a set of reusable and generic components

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 12.0+

## Installation

UIKitCommons is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UIKitCommons'
```

## Use

* ### [Componentes](#markdown-header-componentes)
1. [ModalViewController](#1-modalviewcontroller)

___
## Componentes
___

#### **1. ModalViewController**

![Alt text](/Resources/ModalViewController/modalViewController.gif "ModalViewController")

**Compatibilidad:** Swift

**_v1.0.0:_**: 

- **Métodos:**

```swift

//Present an ModalViewController
func showModal
```

- **Usage examples:**

```swift
let alertView = AlertView().then {
    if #available(iOS 13.0, *) { $0.alertImage = UIImage(systemName: "pencil.circle.fill") }
    $0.titleText = "Title"
    $0.messageText = "Description"
    $0.titleTextColor = .blue
}

self.showFIFAlertCard(
    FIFAlertCardBuilder(
        titleAttributedString: NSAttributedString(string: "Título"), descriptionAttributedString: NSAttributedString(string: "Descripción")
    ),
    primaryCompletion: {
    debugPrint("Callback primario.")
})

let modalConfiguration = ModalConfiguration()
    .setCustomView(alertView)
    
showModal(modalConfiguration, primaryCompletion: {
    print("Primary button tapped")
})
```

## Author

luisMan97, riveraladinojorgeluis@gmail.com

## License

UIKitCommons is available under the MIT license. See the LICENSE file for more info.
