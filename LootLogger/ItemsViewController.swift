//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Hussein Anwar on 13/04/2022.
//

import UIKit

class ItemsViewController: UITableViewController{
    
    //MARK: - Properties
    
    var itemStore: ItemStore!
    var sections: [String] = ["Greater than $50", "$50 or less"]

    //MARK: - Life Cycle

    
    
    
    //MARK: - Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return sections[0]
        } else {
            return sections[1]
        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // if the table view is asking to commit a delete command
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            //remove the item from the store
            itemStore.removeItem(item)
            
            //also remove that row from the table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
        
    //MARK: - Actions
    
    @IBAction func addNewItem(_ sender: UIButton){
//        //Make a new index path for the 0th section, last row
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//
//        //Insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        //Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        //get the section of the item
        
        
        //Figure out where that item is in the array
        if let index = itemStore.allItems.firstIndex(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            
            // INSERT THIS NEW ROW INTO THE TABLE
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton){
        //If you're currently in editing mode
        if isEditing {
            //Change text of button to inform the user of state
            sender.setTitle("Edit", for: .normal)
            
            //Turn off editing mode
            setEditing(false, animated: true)
        } else {
            //Change text of button to inform the user of state
            sender.setTitle("Done", for: .normal)
            
            //Enter editing mode
            setEditing(true, animated: true)
        }
        
    }
    
    
    
}
