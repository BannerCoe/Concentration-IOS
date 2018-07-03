//
//  Cards.swift
//  Concentration
//
//  Created by AungMyoLwin on 6/26/18.
//  Copyright © 2018 Banner. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatch = false
    var identifier : Int
    
    private static var identiferFactory = 0;
    
    private static func getUniqueIdentifer() -> Int{
        identiferFactory += 1
     return identiferFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifer()
    }
}
