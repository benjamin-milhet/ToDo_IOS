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
    var dateRendu: Date
    
    init(_nom: String, _desc: String, _date: Date) {
        self.nom = _nom
        self.desc = _desc
        self.isCheck = false
        self.dateRendu = _date
    }
}
