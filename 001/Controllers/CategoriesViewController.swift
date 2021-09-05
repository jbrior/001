//
//  CategoriesViewController.swift
//  001
//
//  Created by Jesse Brior on 9/5/21.
//

import UIKit
import FirebaseDatabase

class CategoriesViewController: UIViewController {
     
    let ref = Database.database().reference()
    var categories = [String]()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Categories"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        
        getDataFromFirebase()
    }
    
    func getDataFromFirebase() {
        ref.child("Categories").observeSingleEvent(of: .value, with: { snapshot in
            if let dic = snapshot.value as? [String] {
                self.categories = dic
            }
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.center = view.center
    }
}

// MARK: Setup Required Functions for the tableview
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(categories[indexPath.row].capitalized)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = SelectedCategoryViewController()
        vc.categorySelected = categories[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
