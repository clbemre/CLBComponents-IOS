//
//  RobotoFontType.swift
//  CLBComponents
//
//  Created by EMRE CELEBI on 31.12.2018.
//  Copyright © 2018 cLb. All rights reserved.
//

import Foundation

enum RobotoFontType: String {
    case RB_MEDIUM = "Roboto-Medium"
    case RB_LIGHT = "Roboto-Light"
    case RB_REGULAR = "Roboto-Regular"
    case RB_MEDIUM_ITALIC = "Roboto-MediumItalic"
    case RB_BOLD_CONDENSED = "Roboto-BoldCondensed"
    case RB_BOLD_CONDENSED_ITALIC = "Roboto-BoldCondensedItalic"
    case RB_CONDENSED = "Roboto-Condensed"
    case RB_THIN_ITALIC = "Roboto-ThinItalic"
    case RB_BOLD_ITALIC = "Roboto-BoldItalic"
    case RB_LIGHT_ITALIC = "Roboto-LightItalic"
    case RB_CONDENSED_ITALIC = "Roboto-CondensedItalic"
    case RB_ITALIC = "Roboto-Italic"
    case RB_BLACK_ITALIC = "Roboto-BlackItalic"
    case RB_BOLD = "Roboto-Bold"
    case RB_THIN = "Roboto-Thin"
    case RB_BLACK = "Roboto-Black"

    func type() -> String {
        return self.rawValue
    }
}
