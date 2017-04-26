//
//  Player.swift
//  Storyboard Tut1
//
//  Created by ThangLQ on 4/26/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

struct Player {
    var name: String?
    var game: String?
    var rating: Int?
    
    init (name: String?, game:String?, rating: Int?) {
        self.name = name
        self.game = game
        self.rating = rating
    }
}
