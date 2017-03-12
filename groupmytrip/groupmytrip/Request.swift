//
//  Request.swift
//  groupmytrip
//
//  Created by Satyam Jaiswal on 3/11/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit

class Request: NSObject {
    var id: String?
    var from: User?
    var to: User?
    var groupId: String?
    var invited: Bool?
    var canBringCar: Bool?
    var canShellForGas: Bool?
}
