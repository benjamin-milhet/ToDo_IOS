//
//  CategoryViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 29/12/2022.
//

import UIKit

/**
 *  CategoryViewController
 *  @brief Classe permettant de gérer les catégories
 */
class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var myCategoryTableView: UITableView! // Tableau d'affichage des catégories
    @IBOutlet weak var myCategorySearchBar: UISearchBar! // Barre de recherche des catégories
    
    var myCategory: [Category] = [] // Liste des catégories
    var myRechercheCategory: [Category] = [] // Liste des catégories recherchées
    
    /**
     *  viewDidLoad
     *  @brief Fonction appelée au chargement de la vue
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCategory.append(Category(_nom: "Travail")) // Ajout d'une catégorie "Travail"
        self.myCategory.append(Category(_nom: "Maison")) // Ajout d'une catégorie "Maison"
        
        self.myRechercheCategory = self.myCategory // Initialisation de la liste des catégories recherchées avec la liste des catégories
        
        self.myCategoryTableView.dataSource = self
        self.myCategoryTableView.delegate = self
        self.myCategorySearchBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myRechercheCategory.count // Retourne le nombre de catégories recherchées
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell // Récupération de la cellule
        cell.myNom.text = self.myRechercheCategory[indexPath.row].nom // Affichage du nom de la catégorie
        return cell
    }
    
    /**
     *  tableView
     *  @brief Fonction permettant de gérer le swipe sur une cellule afin de supprimer une catégorie
     */
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer", handler: {(action, view, completionHandler) in
            let row = indexPath.row // Récupération de la ligne sélectionnée
            let deleteCategory = self.myRechercheCategory[row] // Récupération de la catégorie sélectionnée
            self.myCategory = self.myCategory.filter(){$0 !== deleteCategory} // Suppression de la catégorie sélectionnée dans la liste des catégories
            completionHandler(true) 
            self.myRechercheCategory = self.myCategory // Mise à jour de la liste des catégories recherchées avec la liste des catégories
            self.myCategorySearchBar.text = "" // Réinitialisation de la barre de recherche
            self.myCategoryTableView.reloadData() // Mise à jour de l'affichage
        })])
        
        return configuration 
    }
    
    /**
     *  prepare
     *  @brief Fonction appelée avant l'affichage d'une vue afin de lui transmettre des données
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let row = self.myCategoryTableView.indexPathForSelectedRow!.row // Récupération de la ligne sélectionnée
            vc.myCategory = self.myRechercheCategory[row] // Transfert de la catégorie sélectionnée
            vc.myData = self.myRechercheCategory[row].myData // Transfert de la liste des tâche de la catégorie sélectionnée
        }
    }
    
    /**
     *  Cancel
     *  @brief Fonction permettant de revenir à la vue précédente
     */
    @IBAction func Cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddCategoryViewController {
            vc.dismiss(animated: true, completion: nil)
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    /**
     *  Save
     *  @brief Fonction permettant de sauvegarder les données de la vue précédente : Ajouter une nouvelle catégorie
     */
    @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddCategoryViewController { // Récupération de la vue précédente
            if let addNewCategoryNom = vc.addNom { // Récupération du nom de la nouvelle catégorie
                self.myCategory.append(Category(_nom: addNewCategoryNom.text!)) // Ajout de la nouvelle catégorie
                self.myRechercheCategory = self.myCategory // Mise à jour de la liste des catégories recherchées avec la liste des catégories
            }
            self.myCategoryTableView.reloadData() // Mise à jour de l'affichage des catégories
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    /**
     *  searchBar
     *  @brief Fonction permettant de rechercher une catégorie
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.myRechercheCategory = [] // Réinitialisation de la liste des catégories recherchées
        
        if searchText == "" { // Si la barre de recherche est vide, on affiche toutes les catégories
            self.myRechercheCategory = self.myCategory // Mise à jour de la liste des catégories recherchées avec la liste des catégories
        } else { // Sinon, on recherche les catégories correspondant au texte recherché
            for category in myCategory { // Parcours de la liste des catégories
                if category.nom.uppercased().contains(searchText.uppercased()) { // Si le nom de la catégorie contient le texte recherché
                    self.myRechercheCategory.append(category) // Ajout de la catégorie à la liste des catégories recherchées
                }
            }
        }
        
        self.myCategoryTableView.reloadData() // Mise à jour de l'affichage des catégories
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
