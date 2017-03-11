//
//  Message.swift
//  groupmytrip
//
//  Created by Satyam Jaiswal on 3/11/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit

class Message: NSObject {
    var from: User?
    var toUser: User?
    var toGroup: Group?
    var privateChat: Bool?
    var text: String?
}
