//
//  PlayerDetailViewController.swift
//  Storyboard Tut1
//
//  Created by MGX82 on 4/26/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UITableViewController {

    @IBOutlet weak var playerNameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var player: Player?
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            playerNameTextField.becomeFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: playerNameTextField.text, game: "Chess", rating: 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init playerdetail")
    }
    
    deinit {
        print("deinit playerdetail")
    }
}
