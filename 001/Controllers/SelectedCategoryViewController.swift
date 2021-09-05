//
//  SelectedCategoryViewController.swift
//  001
//
//  Created by Jesse Brior on 9/5/21.
//

import UIKit

class SelectedCategoryViewController: UIViewController {
    
    var categorySelected: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let cs = categorySelected else {
            print("no data passed!")
            return
        }
        title = cs.capitalized
        view.backgroundColor = .white
    }
}
