//
//  SwipeablePresenter.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol SwipeablePresenter {
    
}

class SwipeablePresenterImplementation: SwipeablePresenter {
    private weak var view: SwipeableView?
    
    init(view: SwipeableView) {
        self.view = view
    }
    
}
