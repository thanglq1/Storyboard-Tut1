//
//  PlayersViewController.swift
//  Storyboard Tut1
//
//  Created by ThangLQ on 4/26/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let player1 = Player(name: "ThangLQ", game: "Zalo", rating: 4)
        let player2 = Player(name: "TuNA", game: "Facebook", rating: 5)
        let player3 = Player(name: "DoanPV", game: "Flapy", rating: 3)
        players.append(player1)
        players.append(player2)
        players.append(player3)
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
        return players.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerCell

        // Configure the cell...
        let player = players[indexPath.row] as Player
        cell?.player = player

        return cell!
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }

    
    @IBAction func cancelPlayerViewController(segue: UIStoryboardSegue) {
        print("cancel clicked")
    }
    
    @IBAction func savePlayerDetail(segue: UIStoryboardSegue) {
        print("save clicked")
        if let playerDetailViewController = segue.source as? PlayerDetailViewController {
            if let player = playerDetailViewController.player {
                players.append(player)
                let indexPath = NSIndexPath(row: players.count - 1, section: 0)
                
                tableView.insertRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
//                tableView.reloadData()
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
