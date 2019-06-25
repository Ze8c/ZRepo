//
//  SearchCell.swift
//  ZRepo
//
//  Created by Мак on 25/06/2019.
//  Copyright © 2019 Мак. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var searchField: UISearchBar!
    
    var parentView: LookForView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpSearchBar()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SearchCell: UISearchBarDelegate {
    
    private func setUpSearchBar() {
        searchField.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            searchBar.text = nil
            parentView.searching(searchText)
        }
    }
    
}
