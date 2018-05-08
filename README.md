# MultiContactPicker

[![Language: Swift 4](https://img.shields.io/badge/language-swift4-f48041.svg?style=flat-square)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platforms-iOS%211.0+-333333.svg?style=flat-square)]

Multi Contact Picker gives you the ability to access your contacts and return CNContact list

<img src="https://user-images.githubusercontent.com/19505152/39757920-9f7a2c0e-52ce-11e8-8aee-54eff31477a5.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/39757941-b63d8dfa-52ce-11e8-81f7-7f7348e588fd.png" width="200"> <img src="https://user-images.githubusercontent.com/19505152/39757947-bbcf14a0-52ce-11e8-8c93-058376332af1.png" width="200">

# Installation #

## CocoaPods ##
MultiContactPicker is available on CocoaPods. Just add the following to your project Podfile:

`pod 'MultiContactPicker', :git => 'https://github.com/Radwa5aled/MultiContactPicker.git', :tag => '1.0.2'`

# Requirements #

* iOS11+
* Swift 4.0

# Features #

1. Single and Multi selection
2. Search Contacts
3. Show details of Contacts
4. Return list of CNContact object

# Initialization #

1. 
```swift
import MultiContactPicker
```
2.
```swift
MultiContactPicker.shared.openContacts(controller:self)
```
3. Add `Privacy - Contacts Usage Description` to Info.plist

# Delegates #

MultiContactPicker provides you delegate `MultiContactPickerProtocol` for getting the callbacks on the picker

```swift
func selectedContacts(cNContact: [CNContact])
```
## License ##

MultiContactPicker is available under the MIT license.

## Contributors ##

[@Radwa](https://github.com/Radwa5aled)
[@Helmy](https://github.com/MOMMH2008)
