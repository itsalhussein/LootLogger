//
//  ItemStore.swift
//  LootLogger
//
//  Created by Hussein Anwar on 13/04/2022.
//

import UIKit

class ItemStore {
    var allItems = [[Item]]()
    
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        var sectionNumber = 0
        
        if newItem.valueGT50 {
            sectionNumber = 1
        }
        
        allItems[sectionNumber].append(newItem)
        return newItem
    }
    
    func removeItem(_ item: Item){
        var sectionNumber = 0
        
        if item.valueGT50 {
            sectionNumber = 1
        }
        
        if let index = allItems[sectionNumber].firstIndex(of: item){
            allItems[sectionNumber].remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        //Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex.section][fromIndex.row]

        //Remove item from array
        allItems.remove(at: fromIndex)
        
        //Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
}

