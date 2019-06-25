//
//  LookForRepoPresenter.swift
//  ZRepo
//
//  Created by Мак on 24/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import Foundation

protocol LookForViewPresenter {
    init(view: LookForView)
    func loadRepo()
    func search(_ info: String)
    func linkInit(_ info: String)
}

class LookForPresenter: LookForViewPresenter {
    
    unowned let view: LookForView
    private let model: AppData
    
    required init(view: LookForView) {
        self.view = view
        self.model = AppDataImp.shared
    }
    
    func loadRepo() {
        model.indexPage += 1
        NetworkService().repoListRequest(find: model.searchWord, page: model.indexPage) { (info) in
            guard let info = info else { return }
            if self.model.indexPage <= 1 {
                self.view.initRows(info.items)
            } else {
                self.view.addRows(info.items)
            }
        }
    }
    
    func search(_ info: String) {
        model.searchWord = info
        model.indexPage = 0
    }
    
    func linkInit(_ info: String) {
        model.link = info
    }
}
