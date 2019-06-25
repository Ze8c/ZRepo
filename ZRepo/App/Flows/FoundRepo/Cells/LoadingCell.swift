//
//  LoadingCell.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
