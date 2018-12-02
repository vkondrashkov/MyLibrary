//
//  EmojiDataSource.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class EmojiDataSource: NSObject, UICollectionViewDataSource {
    var items: [EmojiNode] = [
        EmojiNode(emoji: "😘"),
        EmojiNode(emoji: "🙄"),
        EmojiNode(emoji: "😎"),
        EmojiNode(emoji: "😀"),
        EmojiNode(emoji: "😨"),
        EmojiNode(emoji: "😈")
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emojiCell", for: indexPath) as! EmojiCollectionViewCell
        cell.display(description: item.description)
        
        return cell
    }
}
