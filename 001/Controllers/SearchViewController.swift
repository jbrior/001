//
//  SearchViewController.swift
//  001
//
//  Created by Jesse Brior on 9/5/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchInput: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        guard let search = searchInput else {
            return
        }
        
        title = search.capitalized
    }
}
