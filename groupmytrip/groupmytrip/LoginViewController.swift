//
//  LoginViewController.swift
//  groupmytrip
//
//  Created by Diana C on 3/10/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.test()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test(){
        /*
        ParseClient.sharedInstance.signup(email: "test@asu.edu", password: "test", success: { (user: PFUser) in
            print("sign-up successful!")
            print(user)
            
        }) { (error: Error) in
            print(error.localizedDescription)
        }
        */
        
        ParseClient.sharedInstance.login(email: "test@asu.edu", password: "test", success: { (user: PFUser) in
            print("login successful!")
            print(user)
            print(user.objectId!)
            let new = User(id: user.objectId!, name: "test name", username: user.username!, date: Date(), bio: "this is bio")
            ParseClient.sharedInstance.updateUserInfo(newUser: new, success: { (updatedUser: PFUser) in
                print(updatedUser)
            }, failure: { (error: Error) in
                print(error.localizedDescription)
            })
            
            
        }) { (error: Error) in
            print(error.localizedDescription)
        }
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
