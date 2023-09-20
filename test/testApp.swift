//
//  testApp.swift
//  test
//
//  Created by Max Seelemann on 19.09.23.
//

import SwiftUI
import MyLibrary

@main
struct testApp: App {
    var body: some Scene {
        WindowGroup {
            SwiftUIView()
				.onAppear {
					print("\(My.test())")
					print("\(NSLocalizedString("mein string", comment: "nope"))")
				}
			Text("mein string")
        }
    }
}
