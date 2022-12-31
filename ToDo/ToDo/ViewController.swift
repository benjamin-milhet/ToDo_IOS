//
//  ViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 07/11/2022.
//

import UIKit

/**
 *  ViewController
 *  @brief Classe permettant de gérer les tâches d'une catégorie 
 */
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView! // Tableau des tâches
    @IBOutlet weak var btnAdd: UIBarButtonItem! // Bouton d'ajout d'une tâche
    @IBOutlet weak var myNavigation: UINavigationItem! // Titre de la catégorie
    
    var myData: [MyData] = [] // Liste des tâches
    var myCategory: Category? // Catégorie
    
    /**
     *  viewDidLoad
     *  @brief Fonction appelée au chargement de la vue
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myNavigation.title = myCategory?.nom // Initialisation du titre de la catégorie
        self.myData = self.myData.sorted(by: { $0.dateRendu < $1.dateRendu}) // Tri des tâches par date de rendu
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myData.count // Retourne le nombre de tâches
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell // Récupération de la cellule
        
        cell.myNom.text = myData[indexPath.row].nom // Initialisation du nom de la tâche
        cell.myDate.text = myData[indexPath.row].convertShortDate() // Initialisation de la date de rendu de la tâche
        cell.myCheck.isOn = myData[indexPath.row].isCheck // Initialisation de l'état de la tâche
        cell.myCheck.tag = indexPath.row // Initialisation du tag de la cellule
        return cell // Retourne la cellule
    }
    
    /**
     *  tableView
     *  @brief Fonction permettant de gérer le swipe sur une cellule afin de supprimer une tâche
     */
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer la ToDo", handler: {(action, view, completionHandler) in
            let row = indexPath.row // Récupération de la ligne sélectionnée
            self.myData.remove(at: row) // Suppression de la tâche
            completionHandler(true) // Confirmation de la suppression
            self.myTableView.reloadData() // Rafraichissement de la vue
        })])
        
        return configuration 
    }
    
    /**
     *  prepare
     *  @brief Fonction permettant de passer les données à la vue suivante
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController { // Passage des données à la vue suivante
            let row = self.myTableView.indexPathForSelectedRow!.row // Récupération de la ligne sélectionnée
            vc.data = self.myData[row] // Passage des données
        }
    }
    
    /**
     *  Cancel
     *  @brief Fonction permettant de revenir à la vue précédente
     */
    @IBAction func Cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController {
            vc.dismiss(animated: true, completion: nil)
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    /**
     *  Save
     *  @brief Fonction permettant de sauvegarder les données de la vue précédente : Ajouter une nouvelle tâche
     */
    @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController { // Récupération des données de la vue précédente
            if let addNewDataNom = vc.addNom, let addNewDataDesc = vc.addDesc, let addNewDataDate = vc.addDate { // Vérification des données
                self.myData.append(MyData(_nom: addNewDataNom.text!, _desc: addNewDataDesc.text!, _date: addNewDataDate.date, _category: myCategory!)) // Ajout des données
                self.myData = myData.sorted(by: { $0.dateRendu < $1.dateRendu}) // Tri des tâches par date de rendu
            }
            self.myTableView.reloadData() // Rafraichissement de la vue
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    /**
     *  changerIsCheck
     *  @brief Fonction permettant de changer l'état de la tâche
     */
    @IBAction func changerIsCheck(_ sender: UISwitch) {
        let row = sender.tag // Récupération de la ligne sélectionnée avec le tag
        self.myData[row].isCheck = sender.isOn // Changement de l'état de la tâche
    }
}

