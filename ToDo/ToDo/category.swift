//
//  category.swift
//  ToDo
//
//  Created by Benjamin Milhet on 29/12/2022.
//

import Foundation

class Category {
    var nom: String
    var myData: [MyData]
    
    init(_nom: String) {
        self.nom = _nom
        self.myData = []
    }
}
