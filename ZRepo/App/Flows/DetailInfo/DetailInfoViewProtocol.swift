//
//  DetailInfoViewProtocol.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation

protocol DetailInfoView: class {
    func loadRepoDirect(for link: String)
}
