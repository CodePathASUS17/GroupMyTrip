//
//  GroupViewCell.swift
//  groupmytrip
//
//  Created by fer on 3/11/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

  @IBOutlet weak var groupIcon: UIImageView!
  @IBOutlet weak var groupName: UILabel!
  @IBOutlet weak var destinationName: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
