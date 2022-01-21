//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Quang Nguyen on 1/17/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    
    @Published private(set) var theme: Theme
    @Published private var model: MemoryGame<String>
    
    init(){
        theme = THEMES_DEFAULT
        model = EmojiMemoryGame.createMemoryGameFromTheme(THEMES_DEFAULT)
    }
    
    static func selectTheme(_ given_theme: ThemeName) -> Theme {
        // View components are optional type, therefore forced unwrapping is necessary.
        return THEMES_SUBJECTS[given_theme]!
    }
    
    static func createMemoryGameFromTheme(_ theme: Theme) -> MemoryGame<String> {
        return createMemoryGame(theme.emojiSet, theme.numberOfPairs)
    }
    
    static func createMemoryGame(_ emojiSet: Array<String>, _ numberOfPairsOfCard: Int) -> MemoryGame<String> {
        let shuffled_emojis = emojiSet.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: 4){
            pairIndex in shuffled_emojis[pairIndex]
        }
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(self.theme.emojiSet, self.theme.numberOfPairs)
    }
    
    func getThemeColor() -> UIColor {
        return theme.themeColor
    }
    
    func changeTheme() {
        let nextTheme = theme.themeName.rawValue + 1
        theme = THEMES_SUBJECTS[ThemeName(rawValue: nextTheme % ThemeName.allCases.count)!]!
        newGame()
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // Mark: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
