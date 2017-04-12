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
    
    let groupClass = "Group"
    let messageClass = "Message"
    let requestClass = "Request"
    let groupMemberClass = "Group_Members"
    
    static var sharedInstance = ParseClient()
    
    func currentUser() -> PFUser? {
        let currentUser = PFUser.current()
        if (currentUser != nil) {
            return currentUser!
        }
        
        return nil
    }
    
    func login(email: String, password: String, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        print("login initiated...")
        PFUser.logInWithUsername(inBackground: email, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                print("login successful!")
                if let user = user{
                    success(user)
                }
            }
        }
    }
    
    func signup(email: String, password: String, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        print("sign-up initiated...")
        let newUser = PFUser()
        newUser.username = email
        newUser.password = password
        
        newUser.signUpInBackground { (signupSuccessful: Bool, error: Error?) in
            if let error = error{
                failure(error)
            }else{
                if signupSuccessful {
                    print("sign-up successful!")
                    success(newUser)
                }
            }
        }
    }
    
    func updateUserInfo(newUser: User, success: @escaping (PFUser) -> Void, failure: @escaping (Error) -> Void){
        let query = PFUser.query()
        query?.getObjectInBackground(withId: newUser.id!, block: { (user: PFObject?, error: Error?) in
            if let user = user{
                if let name = newUser.name {
                    user.setObject(name, forKey: "name")
                }
                
                if let bio = newUser.bio {
                    user.setObject(bio, forKey: "bio")
                }
                
                if let dob = newUser.dob{
                    user.setObject(dob, forKey: "dob")
                }
                
                if let phone = newUser.phone{
                    user.setObject(phone, forKey: "phone")
                }
                
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
        })
    }
    
    func createGroup(name: String, location: String, destination: String, date: Date, duration: Float, admins: [String], success: @escaping (PFObject) -> Void, failure: @escaping (Error) -> Void){
        
        let newGroup = PFObject(className: groupClass)
        newGroup.setObject(name, forKey: "name")
        newGroup.setObject(location, forKey: "trip_start")
        newGroup.setObject(destination, forKey: "trip_destination")
        newGroup.setObject(date, forKey: "trip_date")
        newGroup.setObject(duration, forKey: "trip_duration")
        newGroup.setObject(admins, forKey: "admins")
        newGroup.saveInBackground { (successful: Bool, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if successful{
                    success(newGroup)
                }
            }
        }
    }
    
    func updateGroupInfo(group: Group, success: @escaping (PFObject) -> Void, failure: @escaping (Error) -> Void){
        let query = PFQuery(className: groupClass)
        query.getObjectInBackground(withId: group.id!) { (groupObject: PFObject?, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if let grpObj = groupObject{
                    if let name = group.name {
                        grpObj.setObject(name, forKey: "name")
                    }
                    
                    if let location = group.tripStart {
                        grpObj.setObject(location, forKey: "trip_start")
                    }
                    
                    if let destination = group.tripDestination {
                        grpObj.setObject(destination, forKey: "trip_destination")
                    }
                    
                    if let date = group.tripDate {
                        grpObj.setObject(date, forKey: "trip_date")
                    }
                    
                    if let duration = group.tripDuration {
                        grpObj.setObject(duration, forKey: "trip_duration")
                    }
                    
                    if let admins = group.admins {
                        grpObj.setObject(admins, forKey: "admins")
                    }
                    
                    grpObj.saveInBackground(block: { (successful: Bool, error: Error?) in
                        if let error = error {
                            failure(error)
                        }else{
                            if successful {
                                success(grpObj)
                            }
                        }
                    })
                }
            }
        }
    }
    
    func addGroupMember(groupMember: GroupMembers, success: @escaping (PFObject) -> Void,  failure: @escaping (Error) -> Void){
        let newMembership = PFObject(className: groupMemberClass)
        if let user_id  = groupMember.userId {
            newMembership.setObject(user_id, forKey: "user_id")
        }
        
        if let group_id  = groupMember.groupId {
            newMembership.setObject(group_id, forKey: "group_id")
        }
        
        if let canBringCar = groupMember.canBringCar {
            newMembership.setObject(canBringCar, forKey: "can_bring_car")
        }
        
        if let canShellForGas = groupMember.canShellForGas {
            newMembership.setObject(canShellForGas, forKey: "can_shell_for_gas")
        }
        
        newMembership.saveInBackground { (successful: Bool, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if successful{
                    success(newMembership)
                }
            }
        }
    }
    
    func requestMembership(request: Request, success: @escaping (PFObject) -> Void,  failure: @escaping (Error) -> Void){
        
        let newRequest = PFObject(className: requestClass)
        if let from  = request.from {
            newRequest.setObject(from, forKey: "from")
        }
        
        if let to  = request.to {
            newRequest.setObject(to, forKey: "to")
        }
        
        if let groupId = request.groupId {
            newRequest.setObject(groupId, forKey: "group_id")
        }
        
        newRequest.setObject(false, forKey: "invited")
        
        if let canBringCar = request.canBringCar {
            newRequest.setObject(canBringCar, forKey: "can_bring_car")
        }
        
        if let canShellForGas = request.canShellForGas {
            newRequest.setObject(canShellForGas, forKey: "can_shell_for_gas")
        }
        
        newRequest.saveInBackground { (successful: Bool, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if successful{
                    success(newRequest)
                }
            }
        }
    }
    
    func invite(request: Request, success: @escaping (PFObject) -> Void,  failure: @escaping (Error) -> Void){
        
        let newRequest = PFObject(className: requestClass)
        if let from  = request.from {
            newRequest.setObject(from, forKey: "from")
        }
        
        if let to  = request.to {
            newRequest.setObject(to, forKey: "to")
        }
        
        if let groupId = request.groupId {
            newRequest.setObject(groupId, forKey: "group_id")
        }
        
        newRequest.setObject(true, forKey: "invited")
        
        if let canBringCar = request.canBringCar {
            newRequest.setObject(canBringCar, forKey: "can_bring_car")
        }
        
        if let canShellForGas = request.canShellForGas {
            newRequest.setObject(canShellForGas, forKey: "can_shell_for_gas")
        }
        
        newRequest.saveInBackground { (successful: Bool, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if successful{
                    success(newRequest)
                }
            }
        }
    }
    
    func postMessage(from: User, toUser: User?, toGroup: Group?, isPrivate: Bool, timestamp: Date, success: @escaping (PFObject) -> Void,  failure: @escaping (Error) -> Void){
        
        let newMessage = PFObject(className: messageClass)
        if let from  = from.id {
            newMessage.setObject(from, forKey: "from")
        }
        
        if let to  = toUser?.id {
            newMessage.setObject(to, forKey: "to")
        }
        
        if let groupId = toGroup?.id {
            newMessage.setObject(groupId, forKey: "group_id")
        }
        
        newMessage.setObject(isPrivate, forKey: "is_private")
        
        newMessage.saveInBackground { (successful: Bool, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if successful{
                    success(newMessage)
                }
            }
        }
    }
    
    func getGroupMessages(groupId: String, success: @escaping ([PFObject]) -> Void,  failure: @escaping (Error) -> Void){
        let query = PFQuery(className: "Message")
        query.whereKey("group_id", equalTo: groupId)
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if let messages = messages{
                    success(messages)
                }
            }
        }
    }
    
    func getYourGroupIds(userId: Int, success: @escaping ([PFObject]) -> Void, failure: @escaping (Error) -> Void) {
        let query = PFQuery(className: "Association")
        query.whereKey("user_id", equalTo: userId)
        query.includeKey("trip_id")
        query.findObjectsInBackground { (groupIds: [PFObject]?, error: Error?) in
            if (error != nil) {
                failure(error!)
            } else {
                if let groupIds = groupIds {
                    success(groupIds)
                }
            }
        }
    }
    
    func getGroups(groupIds: [Int], success: @escaping ([PFObject]) -> Void, failure: @escaping (Error) -> Void) {
        let query = PFQuery(className: "Group")
        query.whereKey("group_id", containedIn: groupIds)
        query.includeKeys(["group_id", "name", "trip_start", "trip_destination", "trip_date", "trip_duration", "admins"])
        query.findObjectsInBackground { (groups: [PFObject]?, error: Error?) in
            if (error != nil) {
                failure(error!)
            } else {
                if let groups = groups {
                    success(groups)
                }
            }
        }
    }
    
    /*
    func getPrivateMessages(groupId: String, success: @escaping ([PFObject]) -> Void,  failure: @escaping (Error) -> Void){
        let query = PFQuery(className: "Message")
        query.whereKey("group_id", equalTo: groupId)
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if let error = error {
                failure(error)
            }else{
                if let messages = messages{
                    success(messages)
                }
            }
        }
    }
    */
}
