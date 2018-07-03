//
//  ViewController.swift
//  Concentration
//
//  Created by Banner-PC on 6/18/18.
//  Copyright © 2018 Banner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Conentration(numbersOfPairOfCard: numberOfPairedOfCard)
    
    var numberOfPairedOfCard : Int {
        get{
            return (cardButtons.count + 1) /  2
        }
    }
    
    private(set) var flipCount = 0{
        didSet{
            flipCountLabel.text="Flips : \(flipCount)"
        }
    }
    
    @IBOutlet private  var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
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
    
    private var emojiChooser = ["🎃","👻","😵","😈","🧠"]
    
    private var emojiDict = [Int:String]()
    
    private func emoji (for card : Card) -> String {
        
        if emojiDict[card.identifier] == nil, emojiChooser.count > 0 {
            emojiDict[card.identifier] = emojiChooser.remove(at: emojiChooser.count.arc4Random)
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
    
}

extension Int {
    var arc4Random : Int {
        if self > 0 {
            return Int( arc4random_uniform(UInt32(self)))
        }else if  self < 0 {
            return -Int( arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
        
    }
}

