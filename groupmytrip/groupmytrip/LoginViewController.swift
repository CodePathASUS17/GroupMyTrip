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

  @IBOutlet weak var userBox: UITextField!
  @IBOutlet weak var passwordBox: UITextField!
  @IBOutlet weak var signUpB: UIButton!
  @IBOutlet weak var loginB: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.test()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
<<<<<<< HEAD
  
=======
    
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
    

>>>>>>> d78fa23bcdbfd295e4a9076f729f0b1dab560736
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
