//
//  PreferenceKeys.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/7/23.
//

import SwiftUI


struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
