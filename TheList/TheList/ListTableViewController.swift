//
//  ListTableViewController.swift
//  TheList
//
//  Created by Anjel Villafranco on 9/28/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

let API_ROOT = "https://api.github.com"
let myProfileURL = API_ROOT + "/users/anjel0552"

//https://api.github.com/users/anjel0552

class ListTableViewController : UITableViewController {
    
    var listItems : [[String:AnyObject]] = [
        
        [
            "name" : "Steve", "likes" : 2],  // dictionary. key value pair. this is setting up a key index vlaue.
        [
            "name" : "Banana", "likes" : 89],
        [
            "name" : "Despicable", "likes" : 1],
        [
            "name" : "Me", ],
        [
             "likes" : 94567]
        
    ]
       
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath)
        
        //         Configure the cell...
        //indexPath
        // - row
        // - section
        //
        let listItem = listItems[indexPath.row]
        
        let name = listItem["name"] as? String ?? "No Name"
        let likes = listItem["likes"] as? Int ?? 0
        
         cell.textLabel?.text = "\(name) \(likes)"
//        if let name = listItem["name"] as? String,
//            let likes = listItem["likes"] as? Int
//             where name != "Banana" {
//                
//                cell.textLabel?.text = "\(name) \(likes)"
//        }
//        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
