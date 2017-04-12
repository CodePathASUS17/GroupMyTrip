//
//  YourGroupsViewController.swift
//  groupmytrip
//
//  Created by Diana C on 3/10/17.
//  Copyright © 2017 Diana C. All rights reserved.
//
import UIKit
import Parse

class YourGroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var groupsTable: UITableView!
    
    
    var groups: [Group]?
    var pfUser: PFUser?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        groupsTable.delegate = self
        groupsTable.dataSource = self
        
        self.pfUser = ParseClient.sharedInstance.currentUser()
        self.user = User(user: pfUser!)
        self.user?.id = "0001"
        
        var groupIds = [Int]()
        ParseClient.sharedInstance.getYourGroupIds(userId: Int((user?.id)!)!, success: { (ids: [PFObject]) in
            for id in ids {
                groupIds.append(id["trip_id"] as! Int)
            }
        }) { (error: Error) in
            print(error.localizedDescription)
        }
        
        ParseClient.sharedInstance.getGroups(groupIds: groupIds, success: { (groups: [PFObject]) in
            for newGroup in groups {
                self.groups?.append(Group(group: newGroup))
            }
            self.groupsTable.reloadData()
            
        }) { (error: Error) in
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.groups != nil {
            return (self.groups?.count)!
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupsTable.dequeueReusableCell(withIdentifier: "groupCell") as! GroupCell
        groups?[indexPath.row].picture?.getDataInBackground(block: { (imageData: Data?, error: Error?) in
            if (error == nil) {
                let image = UIImage(data: imageData!)
                cell.groupIcon?.image = image
            }
        })
        cell.groupNameLabel.text = groups?[indexPath.row].name!
        cell.destinationLabel.text = groups?[indexPath.row].tripDestination!
        cell.dateLabel.text = String(describing: groups?[indexPath.row].tripDate!)
        
        return cell
    }
}
