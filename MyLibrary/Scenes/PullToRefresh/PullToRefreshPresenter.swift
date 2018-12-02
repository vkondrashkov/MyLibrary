//
//  PullToRefreshPresenter.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol PullToRefreshPresenter {
    func didPulledToRefresh()
}

class PullToRefreshPresenterImplementation: PullToRefreshPresenter {
    private weak var view: PullToRefreshView?
    
    init(view: PullToRefreshView) {
        self.view = view
    }
    
    func didPulledToRefresh() {
        let newEmojiList: [EmojiNode] = [
            EmojiNode(emoji: "😍"),
            EmojiNode(emoji: "🌚"),
            EmojiNode(emoji: "😼"),
            EmojiNode(emoji: "😄"),
            EmojiNode(emoji: "😅"),
            EmojiNode(emoji: "☺️"),
            EmojiNode(emoji: "😜"),
            EmojiNode(emoji: "🙂")
        ]
        view?.display(emojiList: newEmojiList)
        view?.endRefreshing()
    }
}
