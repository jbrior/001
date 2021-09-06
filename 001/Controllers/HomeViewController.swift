//
//  ViewController.swift
//  001
//
//  Created by Jesse Brior on 9/1/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var enteredSearch: String!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Amish Goods"
        label.font = UIFont(name: "Avenir-Heavy", size: 50)
        label.textColor = .systemIndigo
        label.textAlignment = .center
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lancaster, PA"
        label.font = UIFont(name: "Avenir-Heavy", size: 25)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.text = "What are you searching for?"
        label.textColor = .white
        label.font = UIFont(name: "Avenir", size: 30)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let searchBar: UITextField = {
        let bar = UITextField()
        bar.backgroundColor = .clear
        bar.layer.cornerRadius = 25
        bar.layer.borderColor = UIColor.link.cgColor
        bar.layer.borderWidth = 2
        bar.textAlignment = .center
        bar.font = UIFont(name: "Avenir", size: 25)
        bar.attributedPlaceholder = NSAttributedString(string: "Start typing here...",
                                                       attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        bar.textColor = .white
        bar.addTarget(self, action: #selector(editingStarted), for: .allEditingEvents)
        bar.autocorrectionType = .no
        bar.autocapitalizationType = .none
        bar.returnKeyType = .continue
        bar.clearButtonMode = .always
        return bar
    }()
    
    private let searchBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 25)
        button.addTarget(self, action: #selector(didTapSearch), for: .touchDown)
        button.isEnabled = false
        return button
    }()
    
    private let categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Or \n search by categories"
        label.textColor = .white
        label.font = UIFont(name: "Avenir", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let categoriesBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("Categories", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 25)
        return button
    }()
    
    private let infoBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 25)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        
        searchBar.delegate = self
        
        // Add Subviews
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(searchLabel)
        view.addSubview(searchBar)
        view.addSubview(searchBtn)
        view.addSubview(categoriesLabel)
        view.addSubview(categoriesBtn)
        view.addSubview(infoBtn)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.backButtonTitle = "Back"
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemIndigo,
            NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 50)!
        ]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        
        let widthForObjects = view.width - 10
        
        titleLabel.frame = CGRect(x: 0, y: 65, width: widthForObjects, height: 50)
        titleLabel.center.x = view.center.x
        
        subTitleLabel.frame = CGRect(x: 0, y: titleLabel.bottom + 10, width: widthForObjects, height: 30)
        subTitleLabel.center.x = view.center.x
        
        searchLabel.frame = CGRect(x: 0, y: subTitleLabel.bottom + 25, width: widthForObjects, height: 75)
        searchLabel.center.x = view.center.x
        
        searchBar.frame = CGRect(x: 0, y: searchLabel.bottom + 10, width: widthForObjects, height: 50)
        searchBar.center.x = view.center.x
        
        searchBtn.frame = CGRect(x: 0, y: searchBar.bottom + 10, width: widthForObjects, height: 50)
        searchBtn.center.x = view.center.x
        
        categoriesLabel.frame = CGRect(x: 0, y: searchBtn.bottom + 10, width: widthForObjects, height: 60)
        categoriesLabel.center.x = view.center.x
        
        categoriesBtn.frame = CGRect(x: 0, y: categoriesLabel.bottom + 10, width: widthForObjects, height: 50)
        categoriesBtn.center.x = view.center.x
        categoriesBtn.addTarget(self, action: #selector(didTapCategories), for: .touchUpInside)
        
        infoBtn.frame = CGRect(x: 0, y: view.bottom - 100, width: 50, height: 50)
        infoBtn.center.x = view.center.x
        infoBtn.addTarget(self, action: #selector(didTapInfo), for: .touchUpInside)
    }
    
    @objc private func editingStarted() {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            searchBtn.isEnabled = false
            return
        }
        enteredSearch = searchText
        searchBtn.isEnabled = true
    }
    
    @objc private func didTapSearch() {
        let vc = SearchViewController()
        vc.searchInput = enteredSearch
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapCategories() {
        let vc = CategoriesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapInfo() {
        let vc = InfoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

