//
//  DetailInfoPresenter.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation

protocol DetailViewPresenter {
    init(view: DetailInfoView)
    func linkRequest()
}

class DetailInfoPresenter: DetailViewPresenter {
    
    unowned let view: DetailInfoView
    private let model: AppData
    
    required init(view: DetailInfoView) {
        self.view = view
        self.model = AppDataImp.shared
    }
    
    func linkRequest() {
        view.loadRepoDirect(for: model.link)
    }
}
