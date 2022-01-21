//
//  Theme.swift
//  Memorize
//
//  Created by Quang Nguyen on 1/19/22.
//

import Foundation
import SwiftUI

struct Theme : Equatable {
    var themeName: ThemeName
    var themeColor: UIColor
    var emojiSet: Array<String>
    var numberOfPairs: Int
    
    init(theme themeName: ThemeName = ThemeName.blue, _ themeColor: UIColor = UIColor.blue, _ emojiSet: Array<String> = [], _ numberOfPairs: Int = 0){
        self.themeName = themeName
        self.themeColor = themeColor
        self.emojiSet = emojiSet
        self.numberOfPairs = numberOfPairs
    }
}
