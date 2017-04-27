//
//  GamePickerViewController.swift
//  Storyboard Tut1
//
//  Created by ThangLQ on 4/26/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {
    
    var games = ["Facebook", "Zalo", "Twiter", "Hangout", "Viber", "Yahoo"]
    var selectedGameIndex: Int?
    var selectedGameName: String? {
        didSet {
            if let gameName = selectedGameName {
                selectedGameIndex = games.index(of: gameName)
            }
        }
    }
    
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)

        cell.textLabel?.text = games[indexPath.row]
        if indexPath.row == selectedGameIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = selectedGameIndex{
            let cell = tableView.cellForRow(at: NSIndexPath(row: indexPath, section: 0) as IndexPath)
            cell?.accessoryType = .none
        }
        
        selectedGameName = games[indexPath.row]
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SaveGameName" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                if let index = indexPath?.row {
                    selectedGameName = games[index]
                    print("prepare selectedGameName= \(String(describing: selectedGameName))")
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
