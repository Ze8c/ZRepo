//
//  ExtString.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation

extension String {
    
    public func strToURL() -> URL? {
        return URL(string: self)
    }
}
