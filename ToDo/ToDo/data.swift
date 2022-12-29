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
    var category: Category
    
    init(_nom: String, _desc: String, _date: Date, _category: Category) {
        self.nom = _nom
        self.desc = _desc
        self.isCheck = false
        self.dateRendu = _date
        self.category = _category
        self.category.myData.append(self)
    }
    
    func convertDate() -> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE dd MMMM yyyy"
        dateFormater.locale = Locale(identifier: "FR-fr")
        let dateFormat = dateFormater.string(from: self.dateRendu)
        return dateFormat
    }
    
    func convertShortDate() -> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        dateFormater.locale = Locale(identifier: "FR-fr")
        let dateFormat = dateFormater.string(from: self.dateRendu)
        return dateFormat
    }
}
