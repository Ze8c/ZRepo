//
//  ExtUITableView.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(nibName name: String, forCellReuseIdentifier identifier: String) {
        let someNib = UINib(nibName: name, bundle: nil)
        self.register(someNib, forCellReuseIdentifier: identifier)
    }
}
