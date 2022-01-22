//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Quang Nguyen on 1/16/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceUpCard: Int?
    private(set) var score: Int
        
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to the card array.
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2+1))
        }
        cards.shuffle()
        score = 0
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[potentialMatchIndex].previouslySeen == true {
                        score -= 1
                    }
                    if cards[chosenIndex].previouslySeen == true {
                        score -= 1
                    }
                }
                cards[chosenIndex].previouslySeen = true
                cards[potentialMatchIndex].previouslySeen = true
                indexOfTheOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var previouslySeen: Bool = false
        var content: CardContent
        
        var id: Int
    }
}


