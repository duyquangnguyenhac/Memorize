//
//  utils.swift
//  Memorize
//
//  Created by Quang Nguyen on 1/19/22.
//

import Foundation
import SwiftUI

enum ThemeName : Int, CaseIterable {
    case blue = 0
    case orange
    case red
}

let THEMES_SUBJECTS : [ThemeName : Theme] = [
    ThemeName.blue : Theme(theme: ThemeName.blue, UIColor.blue, ["🌍", "💧", "👕", "👔", "🌊"], 5),
    ThemeName.red : Theme(theme: ThemeName.red, UIColor.red, ["🚘", "🚒", "🚨", "☎️", "🏎"], 4),
    ThemeName.orange : Theme(theme: ThemeName.orange, UIColor.orange, ["🔥", "🍊", "🍑", "🏀", "⛵️"], 5)
]

let THEMES_DEFAULT : Theme = THEMES_SUBJECTS[ThemeName.blue]!

