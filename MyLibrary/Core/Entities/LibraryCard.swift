//
//  LibraryCard.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 11/25/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class LibraryCard {
    var title: String
    var description: String
    var background: UIColor
    
    init(title: String, description: String, background: UIColor) {
        self.title = title
        self.description = description
        self.background = background
    }
}
