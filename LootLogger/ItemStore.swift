//
//  ItemStore.swift
//  LootLogger
//
//  Created by Hussein Anwar on 13/04/2022.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
}

