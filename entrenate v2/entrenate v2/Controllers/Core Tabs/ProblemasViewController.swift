//
//  ProblemasViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class ProblemasViewController: UIViewController {

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .secondarySystemBackground
        return searchBar
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // navigationController?.navigationBar.topItem?.titleView = searchBar
    }
}
