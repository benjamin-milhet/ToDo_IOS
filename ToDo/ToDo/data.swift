//
//  data.swift
//  ToDo
//
//  Created by Benjamin Milhet on 07/11/2022.
//

import Foundation

class MyData {
    var nom: String
    var desc: String
    var isCheck: Bool
    
    init(nom: String, desc: String) {
        self.nom = nom
        self.desc = desc
        self.isCheck = false 
    }
}
