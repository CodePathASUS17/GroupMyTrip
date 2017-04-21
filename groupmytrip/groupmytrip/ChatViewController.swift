//
//  ChatViewController.swift
//  groupmytrip
//
//  Created by Diana C on 3/10/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var inputField: UITextField!
  @IBOutlet weak var messagesTable: UITableView!
  
  var messages : [Message]!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ChatViewController.dismissKeyboard))
      view.addGestureRecognizer(tap)
      
      messagesTable.delegate = self
      messagesTable.dataSource = self
      messagesTable.rowHeight = UITableViewAutomaticDimension
      
      Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if messages != nil {
      return messages.count
    }
    else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = messagesTable.dequeueReusableCell(withIdentifier: "mesCell") as! messagesViewCell
    let corMes = messages[indexPath.row]
    let realMes = corMes.text
    let fUser = corMes.from
    let tUser = corMes.toUser
    let tGroup = corMes.toGroup
    
    if corMes.from != nil {
      cell.messageText.text = "\(fUser!.username!): \(realMes!)"
    }
    else {
      cell.messageText.text = "\(realMes!)"
    }
    
    return cell
  }
  
  func onTimer()
  {
        messagesTable.reloadData()
  }
  
  @IBAction func exitChat(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

  @IBAction func sendMes(_ sender: Any) {
    
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
