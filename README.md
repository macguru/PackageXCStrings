# PackageXCStrings

Test project for demonstrating Xcode Strings Catalog (xcstrings) in Swift Packages.

### Contents

This project consists of:
- An app target
- A Swift Package

Each target contains a `Localizable.xcstrings` Xcode Strings Catalog. Various places in the app test different ways of loading strings:
- `testApp.swift`: Uses `NSLocalizedString` and SwiftUI's `Text(…)` to load strings from the app bundle
- `MyLibrary.swift`: Uses `NSLocalizedString` to load a string **with a different default value** from the package
- `SwiftUIView.swift`: Uses SwiftUI's `Text` and `LocalizedStringKey` to load strings

All strings in both targets have been localized to German, but in ALL CAPS, so they are easier to spot.

In addition, the package contains a localized Image asset called `.screenshot`. By default the image says "English", vs. in German is says "German".

### Testing

Run the app in the simulator. Use **Run Options > App Language** to switch between English and German localization. As of Xcode 15.0 RC, the behavior is as follows:

- ✅ Strings from app target are localized just fine
- ✅ Image assets from package are localized
- ❌ Strings from package are not localized (the show _just the key_)

### Considerations

- You can tell that Xcode does recognize the `Localizable.xcstrings` in the Package, by making changes to any string (e.g. changing a string key or adding a string), then building the project. Xocde will update the package's strings catalog accordingly. But the strings will not load.
- I commented out the resource processing for the package target (see `Package.swift:18`), as it does not seem to make any difference. Actually I'm not sure what is expected here. 
