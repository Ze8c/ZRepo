//
//  SimpleInfoCell.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import UIKit

class SimpleInfoCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sortDescript: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var stars: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
