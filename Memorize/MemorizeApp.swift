//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Quang Nguyen on 1/11/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
