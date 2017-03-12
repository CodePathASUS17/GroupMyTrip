//
//  User.swift
//  groupmytrip
//
//  Created by Satyam Jaiswal on 3/11/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit
import Parse

class User: NSObject {
    var id: String?
    var username: String?
    var name: String?
    var dob: Date?
    var bio: String?
    var phone: String?
    
    init(user: PFUser){
        if let id = user["_id"] as? String{
            self.id = id
        }
        
        self.username = user.username
        
        if let name = user["name"] as? String{
            self.name = name
        }
        
        if let dateString = user["dob"] as? String{
            let formatter = DateFormatter()
            formatter.dateFormat = ""
            self.dob = formatter.date(from: dateString)
        }
        
        if let bio = user["bio"] as? String{
            self.bio = bio
        }
    }
    
    init(id: String, name: String, username: String, date: Date, bio: String){
        self.id = id
        self.username = username
        self.name = name
        self.dob = date
        self.bio = bio
    }
}
