//
//  AppData.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation

protocol AppData: class {
    
    static var shared: AppDataImp { get }
    var searchWord: String { get set }
    var indexPage: Int { get set }
    var searchResult: [Repositorie] { get set }
    var link: String { get set }
    
}

class AppDataImp: AppData {
    
    static let shared = AppDataImp()
    private init() {}
    
    var link: String = ""
    var searchWord: String = ""
    var indexPage: Int = 0
    var searchResult = [Repositorie]()
}
