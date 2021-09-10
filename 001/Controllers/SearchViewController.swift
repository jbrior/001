//
//  SearchViewController.swift
//  001
//
//  Created by Jesse Brior on 9/5/21.
//

import UIKit
import FirebaseDatabase

class SearchViewController: UIViewController {
    
    let ref = Database.database().reference()
    
    var searchInput: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        guard let search = searchInput else {
            title = "{Title}"
            print("no input passed")
            return
        }
        
        title = search.capitalized
        
        getDataFromFirebase()
    }
    
    func getDataFromFirebase() {
        
    }
}
