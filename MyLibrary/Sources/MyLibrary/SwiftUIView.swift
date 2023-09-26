//
//  SwiftUIView.swift
//  
//
//  Created by Max Seelemann on 19.09.23.
//

import SwiftUI

public struct SwiftUIView: View {
	public init() {
	}
	
	public var body: some View {
		Text("Hello World!", bundle: .module)
		Text(LocalizedStringKey("LocalizedStringKey"), bundle: .module)
		Image(.screenshot)
		Text("my string", bundle: .main)
    }
}

#Preview {
    SwiftUIView()
}
