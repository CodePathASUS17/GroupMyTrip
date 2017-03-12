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

    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    let alertController = UIAlertController(title: "Title", message: "message", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAlertController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setupAlertController(){
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            //            self.emailTextField.text = ""
            //            self.passowrdTextfield.text = ""
        }
        self.alertController.addAction(OKAction)
    }
    
    @IBAction func onSignupTapped(_ sender: Any) {
        if validateFields() {
            let username = self.usernameTextfield.text!
            let password = self.passwordTextField.text!
            ParseClient.sharedInstance.signup(email: username, password: password, success: { (user: PFUser) in
                self.performSegue(withIdentifier: "loginSegue", sender: sender)
//                print(user)
                
            }) { (error: Error) in
                print(error.localizedDescription)
                self.presentAlertController(title: "Error!", message: error.localizedDescription)
            }
        }
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        if validateFields() {
            let username = self.usernameTextfield.text!
            let password = self.passwordTextField.text!
            
            ParseClient.sharedInstance.login(email: username, password: password, success: { (user: PFUser) in

                self.performSegue(withIdentifier: "loginSegue", sender: sender)
                /*
                print(user)
                print(user.objectId!)
                let new = User(id: user.objectId!, name: "test name", username: user.username!, date: Date(), bio: "this is bio")
                ParseClient.sharedInstance.updateUserInfo(newUser: new, success: { (updatedUser: PFUser) in
                    print(updatedUser)
                }, failure: { (error: Error) in
                    print(error.localizedDescription)
                })
                */
            }) { (error: Error) in
                print(error.localizedDescription)
                self.presentAlertController(title: "Error!", message: error.localizedDescription)
            }
        }
        
    }
    
    func validateFields() -> Bool{
        if let username = self.usernameTextfield.text{
            if username.isEmpty {
                self.presentAlertController(title: "Sorry!", message: "Username is required")
                return false
            }else{
                if !username.hasSuffix(".edu") {
                    self.presentAlertController(title: "Error!", message: ".edu email-id required")
                    return false
                }
            }
        }else if let password = self.passwordTextField.text{
            if password.isEmpty{
                self.presentAlertController(title: "Sorry!", message: "Password is required")
                return false
            }
        }
        
        return true
    }
    
    func presentAlertController(title: String, message: String){
        self.alertController.title = title
        self.alertController.message = message
        self.present(self.alertController, animated: true, completion: nil)
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
