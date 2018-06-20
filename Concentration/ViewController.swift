//
//  ViewController.swift
//  Concentration
//
//  Created by Banner-PC on 6/18/18.
//  Copyright © 2018 Banner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text="Flips : \(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChooser = ["🎃","👻","🎃","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
       if let cardNumber = cardButtons.index(of: sender){
             print( "cardnumber = \(cardNumber)")
        flipCard(withEmoji: emojiChooser[cardNumber], on: sender)
        }
        
       
       
    }
    
    func flipCard( withEmoji  emoji :String,on button :UIButton){
        print("fliCard (with Emoji \(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }

    
}

