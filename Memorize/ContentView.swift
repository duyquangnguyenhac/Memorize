//
//  ContentView.swift
//  Memorize
//
//  Created by Quang Nguyen on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
        var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards){
                        card in CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                    }
                }.foregroundColor(Color(viewModel.getThemeColor()))
                .padding(.horizontal)
                .foregroundColor(.red)
            }
            HStack {
                Button(action: {
                    viewModel.changeTheme()
                }){
                    Text("Theme").padding(5)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(.mint)
                )
                Spacer()
                Button(action: {
                    viewModel.newGame()
                }){
                    Text("New Game").padding(5)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(.mint)
                )
            }.padding(.horizontal)
        }.padding(.horizontal)
    }
}



struct CardView: View {
    let card: MemoryGame<String>.Card
        
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3) 
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
