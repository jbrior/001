//
//  DatabaseModel.swift
//  001
//
//  Created by Jesse Brior on 9/5/21.
//

import UIKit

struct Users {
    let firstName: String
    let lastName: String
    let favoriteColor: String
    
    init(firstName: String, lastName: String, favoriteColor: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.favoriteColor = favoriteColor
    }
}

struct Categories {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
