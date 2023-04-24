//
//  ContentView.swift
//  FaerunMemorize
//
//  Created by Collin Poseley on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    var emojisBeastiaryTheme = ["🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐒", "🐔", "🦆", "🦅", "🦉", "🦇", "🐺", "🐗", "🐴", "🦄"]
    var emojisVeggieTheme = ["🥦","🥑","🍈","🥝", "🍎", "🫐", "🥬", "🥭", "🍇", "🍉", "🥥", "🍌", "🍐", "🍑", "🍍", "🍒", "🍓", "🍅", "🥒", "🥕", "🍆", "🫒", "🫑", "🌽"]
    var emojisWeaponTheme = ["🗡️", "🔪", "🪓", "🧨", "💣", "🔫", "⛏️", "⚒️", "🪛", "🔧", "🔨", "🧱", "🪚", "⚔️", "🛡️", "💉", "🪄", "🧪", "📿", "🧿", "⚱️", "🔮"]
//    [[emojisBeastiaryTheme],[emojisVeggieTheme],[emojisWeaponTheme]]
    @State var emojiCount = 15
    @State var emojiTheme = [""]
    
    var body: some View {
        let emojisBeastiaryThemeShuffled = emojisBeastiaryTheme.shuffled()
        let emojisVeggiesThemeShuffled = emojisVeggieTheme.shuffled()
        let emojisWeaponThemeShuffled = emojisWeaponTheme.shuffled()
        
        VStack {
            Text("FAERUN MEMORY")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.gray)
                .padding(.all)
            ScrollView {
                if emojiTheme == emojisBeastiaryTheme {
                    let cardCount = CGFloat(integerLiteral: emojiCount)
                    let cardCountUpscaled = cardCount + 80
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: cardCountUpscaled))]) {
                        ForEach(emojisBeastiaryThemeShuffled[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                } else if emojiTheme == emojisVeggieTheme {
                    let cardCount = CGFloat(integerLiteral: emojiCount)
                    let cardCountUpscaled = cardCount + 80
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: cardCountUpscaled))]) {
                        ForEach(emojisVeggiesThemeShuffled[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                } else {
                    let cardCount = CGFloat(integerLiteral: emojiCount)
                    let cardCountUpscaled = cardCount + 60
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: cardCountUpscaled))]) {
                        ForEach(emojisWeaponThemeShuffled[0..<emojiCount], id: \.self) { emoji in CardView(content: emoji).aspectRatio(2/3, contentMode:.fit)
                    }
                }
            }
            Spacer()
            HStack {
                add
                Spacer()
                veggies
                Spacer()
                weapons
            }
            .foregroundColor(.blue)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .padding(.horizontal)
        }
            .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
    var add: some View {
        VStack {
            Button(action: {emojiTheme = emojisBeastiaryTheme; emojiCount = 12}, label: { Image(systemName: "tortoise")})
            Text("beastiary")
                .font(.caption)
        }
    }
    var veggies: some View {
        VStack {
            Button(action: {emojiTheme = emojisVeggieTheme; emojiCount = Int.random(in: 12..<14)}, label: { Image(systemName: "carrot")})
            Text("veggies")
                .font(.caption)
        }
    }
    var weapons: some View {
        VStack {
            Button(action: {emojiTheme = emojisWeaponTheme; emojiCount = Int.random(in: 16..<20)}, label: { Image(systemName: "frying.pan")})
            Text("weapons")
                .font(.caption)
        }
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        return 70
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill(.yellow)
                shape.stroke(.red, lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
ContentView()
}
}
