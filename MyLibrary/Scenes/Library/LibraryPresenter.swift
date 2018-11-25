//
//  LibraryPresenter.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 11/25/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol LibraryPresenter {
    
}

class LibraryPresenterImplementation: LibraryPresenter {
    private weak var view: LibraryView!
    
    init(view: LibraryView) {
        self.view = view
    }
}
