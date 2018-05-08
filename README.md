# MultiContactPicker
Multi Contact Picker gives you the ability to access your contacts and return CNContact list

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

MultiContactPicker provides you one delegate for getting the callbacks on the picker

```swift
func selectedContacts(cNContact: [CNContact])
```
## License ##

MultiContactPicker is available under the MIT license.

## Contributors ##

[@Radwa](https://github.com/Radwa5aled)
[@Helmy](https://github.com/MOMMH2008)
