//
//  CloseModifier.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/4/23.
//

import Foundation
import SwiftUI

struct CloseModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }

            }
    }
}

extension View {
    func ApplyClose() -> some View {
        self.modifier(CloseModifier())
    }
}
