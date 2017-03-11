//
//  ParseClient.swift
//  groupmytrip
//
//  Created by Satyam Jaiswal on 3/10/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit
import Parse

class ParseClient: NSObject {
    
    let userClass = "User"
    let groupClass = "Group"
    let messageClass = "Message"
    let requestClass = "Request"
    
    static var sharedInstance = Parse.initialize(with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
        configuration.applicationId = ""
        configuration.clientKey = ""
        configuration.server = ""
    })
    )
    
    func login(email: String, password: String, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        PFUser.logInWithUsername(inBackground: email, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if let user = user{
                    success(user)
                }
            }
        }
    }
    
    func signup(email: String, password: String, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        let newUser = PFUser()
        newUser.username = email
        newUser.password = password
        
        newUser.signUpInBackground { (signupSuccessful: Bool, error: Error?) in
            if let error = error{
                failure(error)
            }else{
                if signupSuccessful {
                    success(newUser)
                }
            }
        }
    }
    
    func updateUserInfo(newUser: User, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        let query = PFQuery(className: userClass)
        query.whereKey("_id", equalTo: newUser.id as Any)
        query.getFirstObjectInBackground { (user: PFObject?, error: Error?) in
            if let error = error{
                failure(error)
            }else{
                if let user = user{
                    user["name"] = newUser.name
                    user["bio"] = newUser.bio
                    user["dob"] = newUser.dob
                    user["phone"] = newUser.phone
                    user.saveInBackground(block: { (saveSuccessful: Bool, error: Error?) in
                        if let error = error {
                            failure(error)
                        }else{
                            if saveSuccessful{
                                print("User info updated")
                            }else{
                                print("Error saving user information")
                            }
                        }
                    })
                }
            }
        }
    }
    
    func createGroup(group: Group, success: @escaping (PFObject) -> Void, failure: @escaping (Error) -> Void){
        
    }
    
    func updateGroupInfo(group: Group, success: @escaping (PFObject) -> Void, failure: @escaping (Error) -> Void){
    }
    
    func addGroupMember(user: User, group: Group, success: @escaping (Bool) -> Void,  failure: @escaping (Error) -> Void){
    }
    
    func requestMembership(user: User, group: Group, canBringCar: Bool, canShellForGas: Bool, success: @escaping (Bool) -> Void,  failure: @escaping (Error) -> Void){
    }
    
    func invite(from: User, to: User, group: Group, adminRequested: Bool, success: @escaping (Bool) -> Void,  failure: @escaping (Error) -> Void){
    }
    
    func postChat(from: User, toUser: User?, toGroup: Group?, private: Bool, timestamp: Date, success: @escaping (PFObject) -> Void,  failure: @escaping (Error) -> Void){
    }
    
    func getChat(user: User?, group: Group?, success: @escaping ([PFObject]) -> Void,  failure: @escaping (Error) -> Void){
    }
}
