//
//  AddCategoryViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 29/12/2022.
//

import UIKit

/**
 *  AddCategoryViewController
 *  @brief Classe permettant d'ajouter une catégorie
 */
class AddCategoryViewController: UIViewController {

    @IBOutlet weak var addNom: UITextField! // Champs de saisie du nom de la catégorie
    @IBOutlet weak var btnAddCategory: UIButton! // Bouton d'ajout de la catégorie
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
