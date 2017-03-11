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
    
    func updateUserInfo(user: PFUser, email: String, password: String, name: String, phone: String, bio: String, dob: Date, location: String, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        
    }
    
    func createGroup(name: String, tripLocation: String, tripDate: Date, tripDuration: Int, admins: [PFUser], success: @escaping (PFObject) -> Void, failure: @escaping (Error) -> Void){
        
    }
    
    func updateGroupInfo(groupId: PFObject, name: String, tripLocation: String, tripDate: Date, tripDuration: Int, admins: [PFUser], success: @escaping (PFObject) -> Void, failure: @escaping (Error) -> Void){
    }
    
    func addGroupMember(user: PFUser, groudId: PFObject, canBringCar: Bool, canShellForGas: Bool, success: @escaping (Bool) -> Void,  failure: @escaping (Error) -> Void){
        
    }
}
