//
//  LookForRepoVC.swift
//  ZRepo
//
//  Created by Мак on 24/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import UIKit

class LookForRepoVC: UIViewController {

    @IBOutlet weak var listRepo: UITableView!
    
    var presenter: LookForViewPresenter!
    var fetchingMore = false
    var searchResult = [Repositorie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listRepo.delegate = self
        listRepo.dataSource = self
        listRepo.register(nibName: "SearchCell", forCellReuseIdentifier: "searchCell")
        listRepo.register(nibName: "SimpleInfoCell", forCellReuseIdentifier: "simpleInfoCell")
        listRepo.register(nibName: "LoadingCell", forCellReuseIdentifier: "loadingCell")
        
        presenter = LookForPresenter(view: self)
    }
    
}

//MARK: - Protocols TableView DataSource and Delegate
extension LookForRepoVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return searchResult.count
        } else if section == 2 && fetchingMore {
            return 1
        } else if section == 0 {
            return 1
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
            cell.parentView = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "simpleInfoCell", for: indexPath) as! SimpleInfoCell
            let result = searchResult[indexPath.row]
            cell.language.text = result.language
            cell.name.text = result.name
            cell.stars.text = "🌟\(result.star)"
            cell.sortDescript.text = result.description
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.spinner.startAnimating()
            cell.spinner.isHidden = false
            return cell
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchingMore {
                fetchingMore = true
                listRepo.reloadSections(IndexSet(integer: 1), with: .none)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.presenter.loadRepo()
                    self.fetchingMore = false
                }
            }
        }
    }

    //MARK: - Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let initialViewController = storyboard.instantiateInitialViewController()
            self.navigationController!.pushViewController(initialViewController!, animated: true)
            self.presenter.linkInit(searchResult[indexPath.row].html)
        }
    }
}

//MARK: - Protocol LookForView realisation
extension LookForRepoVC: LookForView {
    
    func searching(_ word: String) {
        self.presenter.search(word)
        self.presenter.loadRepo()
    }
    
    func initRows(_ result: [Repositorie]) {
        self.searchResult = result
        listRepo.reloadData()
    }
    
    func addRows(_ result: [Repositorie]) {
        self.searchResult.append(contentsOf: result)
        listRepo.reloadData()
    }
    
}
