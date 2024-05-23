//
//  env.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 23/05/24.
//

import SwiftUI

struct IsDarkModeKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isDarkMode: Bool {
        get { self[IsDarkModeKey.self] }
        set { self[IsDarkModeKey.self] = newValue }
    }
}
