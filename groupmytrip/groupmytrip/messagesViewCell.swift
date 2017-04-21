//
//  messagesViewCell.swift
//  groupmytrip
//
//  Created by fer on 4/11/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit

class messagesViewCell: UITableViewCell {

  @IBOutlet weak var toLabel: UILabel!
  @IBOutlet weak var fromLabel: UILabel!
  @IBOutlet weak var messageText: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
