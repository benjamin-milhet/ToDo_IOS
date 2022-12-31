//
//  category.swift
//  ToDo
//
//  Created by Benjamin Milhet on 29/12/2022.
//

import Foundation

/**
 *  Category
 *  @brief Classe représentant une catégorie
 */
class Category {
    var nom: String // Nom de la catégorie
    var myData: [MyData] // Liste des tâches de la catégorie
    
    /**
     *  init
     *  @brief Constructeur de la classe Category
     *  @param _nom Nom de la catégorie
     */
    init(_nom: String) {
        self.nom = _nom
        self.myData = []
    }
}
