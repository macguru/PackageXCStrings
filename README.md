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

- ✅ Strings from app target are localized
- ✅ Image assets from package are localized
- ✅ Strings from package are localized (but we need to explicitly mention `bundle: .module`)
- ❌ Xcode does not respect the bundle when updating XCStrings 

### Criticism

The need to specify a bundle when loading strings is obvious only from historical perspective. It does not make sense to implement a modularized "package" system to then try to load strings from the main bundle by default.

Xcode tooling is erroneous in this regard: All strings references in a package are added to the package's `Localizable.xcstrings`, regardless of their source:
- ✅ `Text("Hello World!", bundle: .module)` should be in the packages xcstrings
- ❌ `Text("my string", bundle: .main)` should be NOT be added to the xcstrings, but is
- ❌ `Text("my string")`, as shorthand for the above, has the same problem

Lastly, it's not clear to me what the `resources: [.process("Resources")]` is used and needed for. It seems to work without this as well.
