//
//  AuthorizationPresenter.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/1/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol AuthorizationPresenter {
    
}

class AuthorizationPresenterImplementation: AuthorizationPresenter {
    private weak var view: AuthorizationView?
    
    init(view: AuthorizationView) {
        self.view = view
    }
}
