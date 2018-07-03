//
//  Concentration.swift
//  Concentration
//
//  Created by AungMyoLwin on 6/26/18.
//  Copyright © 2018 Banner. All rights reserved.
//

import Foundation

class Conentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard : Int?{
        get{
            var foundIndex : Int?
            
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                         return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
                    
                }
            }
            
        }

    
    
    func chooseCards(at index : Int)  {
        assert(cards.indices.contains(index), "Concentration.choosecards(at : \(index) ): chose index in not in cards")
        if !cards[index].isMatch {
            if let matchIndx = indexOfOneAndOnlyFaceUpCard , matchIndx != index {
                //if all cards match
                if cards [matchIndx].identifier ==  cards[index].identifier {
                    cards[matchIndx].isMatch = true
                    cards[index].isMatch = true
                }
                cards[index].isFaceUp  = true
                
            }else{
                //either no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numbersOfPairOfCard : Int) {
        assert(numbersOfPairOfCard > 0, "Conentratn.inint \(numbersOfPairOfCard) : ")
        for _ in 1 ... numbersOfPairOfCard {
            let card = Card ()
             cards += [card,card]
        }
        //TODO shuffle the cards
    }
}
