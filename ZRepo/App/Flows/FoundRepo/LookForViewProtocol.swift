//
//  LookForViewProtocol.swift
//  ZRepo
//
//  Created by Мак on 24/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation

protocol LookForView: class {
    
    func initRows(_ result: [Repositorie])
    func searching(_ word: String)
    func addRows(_ result: [Repositorie])
}
