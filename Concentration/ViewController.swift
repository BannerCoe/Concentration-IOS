//
//  ViewController.swift
//  Concentration
//
//  Created by Banner-PC on 6/18/18.
//  Copyright © 2018 Banner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Conentration(numbersOfPairOfCard: cardButtons.count+1 / 2)
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text="Flips : \(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
       if let cardNumber = cardButtons.index(of: sender){
             print( "cardnumber = \(cardNumber)")
        game.chooseCards(at: cardNumber)
        updateViewFormModel()
        
        }
        
    }
    
    func updateViewFormModel() {
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatch ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
            
        }
    }
    
    var emojiChooser = ["🎃","👻","😵","😈","🧠"]
    
    var emojiDict = [Int:String]()
    
    func emoji (for card : Card) -> String {
        
        if emojiDict[card.identifier] == nil, emojiChooser.count > 0 {
                let randomIndex = Int( arc4random_uniform(UInt32( emojiChooser.count)))
                emojiDict[card.identifier] = emojiChooser.remove(at: randomIndex)
            }
         return emojiDict[card.identifier] ?? "?"
}

    
}

