//
//  Color.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 12.03.2022.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTHeme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct LaunchTHeme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
