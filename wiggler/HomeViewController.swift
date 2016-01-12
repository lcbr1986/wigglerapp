//
//  HomeViewController.swift
//  wiggler
//
//  Created by Luis Carlos Rosa on 11/01/16.
//  Copyright © 2016 Wiggler. All rights reserved.
//

import UIKit

let cellIdentifier = "Cell"
class HomeViewController: UIViewController, UITableViewDataSource {
    let msClientSetup = MSClientSetup.sharedInstance
    var table : MSTable?
    var items:[AnyObject] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].objectForKey("text") as? String
        return cell
    }
    
    
    func configureTable() {
        self.table = msClientSetup.client.tableWithName("TodoItem")
        self.table?.readWithCompletion({ (result, error) -> Void in
            if error != nil {
                print("Error: \(error.localizedDescription)")
            } else {
                self.items = result.items
                self.tableView.reloadData()
            }
        })
    }
}
