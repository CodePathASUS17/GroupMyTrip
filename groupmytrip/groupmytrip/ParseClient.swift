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
        
    }
    
    func signup(email: String, password: String, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        
    }
    
    func updateUserInfo(user: User, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        
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
