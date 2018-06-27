//
//  Concentration.swift
//  Concentration
//
//  Created by AungMyoLwin on 6/26/18.
//  Copyright © 2018 Banner. All rights reserved.
//

import Foundation

class Conentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCards(at index : Int)  {
        if !cards[index].isMatch {
            if let matchIndx = indexOfOneAndOnlyFaceUpCard , matchIndx != index {
                //if all cards match
                if cards [matchIndx].identifier ==  cards[index].identifier {
                    cards[matchIndx].isMatch = true
                    cards[index].isMatch = true
                }
                cards[index].isFaceUp  = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numbersOfPairOfCard : Int) {
        for _ in 1 ... numbersOfPairOfCard {
            let card = Card ()
             cards += [card,card]
        }
        //TODO shuffle the cards
    }
}
