//
//  SettingTableViewController.swift
//  pdfhtmlIndexSearch
//
//  Created by Jeff Mahe on 3/17/16.
//  Copyright © 2016 jmahe. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var musicOption:[String] = [
        "Show PDF",
        "Show HTML"]
    
    var selectedOption:String? {
        didSet {
            if let music = selectedOption {
                selectedOptionIndex = musicOption.indexOf(music)!
            }
        }
    }
    var selectedOptionIndex:Int?
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 2    // section 0 has 2 rows
        default: fatalError("Unknown number of sections")
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("OptionCell", forIndexPath: indexPath)
            cell.textLabel?.text = musicOption[indexPath.row]
            if indexPath.row == selectedOptionIndex {
                cell.accessoryType = .Checkmark
                return cell
            } else {
                cell.accessoryType = .None
                return cell
            }
        default: fatalError("Unknown section")
        }
    }
    // Customize the section headings for each section
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0: return "Viewers Choice"
        default: fatalError("Unknown section")
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch(indexPath.section) {
        case 0:
        // Other row is selected - need to deselect it
        if let index = selectedOptionIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedOption = musicOption[indexPath.row]
        
        // Update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
        default: fatalError("Unknown section")
    }
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedOption" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(cell)
                switch(indexPath!.section) {
                case 0:
                    if let index = indexPath?.row {
                        selectedOption = musicOption[index]
                    }
                default: break
                }
            }
        }
    }
}
