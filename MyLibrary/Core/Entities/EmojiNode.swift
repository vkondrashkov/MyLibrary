//
//  EmojiNode.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

class EmojiNode {
    var emoji: String
    var description: String {
        return String(repeating: emoji, count: 5)
    }
    
    init(emoji: String) {
        self.emoji = emoji
    }
}
