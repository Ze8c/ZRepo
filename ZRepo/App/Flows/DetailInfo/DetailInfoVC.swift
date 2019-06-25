//
//  DetailInfoVC.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import UIKit
import WebKit

class DetailInfoVC: UIViewController, WKUIDelegate {
    
    var presenter: DetailViewPresenter!
    
    var repoDirectly: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        repoDirectly = WKWebView(frame: .zero, configuration: webConfiguration)
        repoDirectly.uiDelegate = self
        view = repoDirectly
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = DetailInfoPresenter(view: self)
        presenter.linkRequest()
    }

}

//MARK: - Implementation protocol DetailInfoView
extension DetailInfoVC: DetailInfoView {
    
    func loadRepoDirect(for link: String) {
        DispatchQueue.main.async {
            self.repoDirectly.load(URLRequest(url: link.strToURL()!))
        }
    }
}
