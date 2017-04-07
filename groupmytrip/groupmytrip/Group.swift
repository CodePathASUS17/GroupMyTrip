//
//  Group.swift
//  groupmytrip
//
//  Created by Satyam Jaiswal on 3/11/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit
import Parse

class Group: NSObject {
    var id: String?
    var name: String?
    var tripStart: String?
    var tripDestination: String?
    var tripDate: Date?
    var tripDuration: Float?
    var admins: [User]?
    var picture: PFFile?
    
    init(group: PFObject){
        if let id =  group["_id"] as? String{
            self.id = id
        }
        
        if let name = group["name"] as? String{
            self.name = name
        }
        
        if let location = group["trip_start"] as? String{
            self.tripStart = location
        }
        
        if let location = group["trip_destination"] as? String {
            self.tripDestination = location
        }
        
        if let dateString = group["trip_date"] as? String{
            let formatter = DateFormatter()
            formatter.dateFormat = "" // TODO: Finish formatting date
            self.tripDate = formatter.date(from: dateString)
        }
        
        if let duration = group["trip_duration"] as? Float{
            self.tripDuration = duration
        }
        
        if let admins = group["admins"] as? [PFUser]{
            for admin in admins{
                self.admins?.append(User(user: admin))
            }
        }
        
        if let picture = group["picture"] as? PFFile {
            self.picture = picture
        }
        
    }
}
