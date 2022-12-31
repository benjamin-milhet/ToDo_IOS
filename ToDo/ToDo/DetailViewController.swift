//
//  DetailViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 29/11/2022.
//

import UIKit

/**
 *  DetailViewController
 *  @brief Classe permettant d'afficher les détails d'une tâche
 */
class DetailViewController: UIViewController {
    @IBOutlet weak var nomTache: UILabel! // Label du nom de la tâche
    @IBOutlet weak var nomDesc: UILabel! // Label de la description de la tâche
    @IBOutlet weak var barreControle: UINavigationItem! // Barre de navigation
    @IBOutlet weak var myDate: UILabel! // Label de la date de la tâche
     
    var data: MyData? // Tâche à afficher

    /**
     *  viewDidLoad
     *  @brief Fonction appelée lors du chargement de la vue
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tache = data { // Si la tâche n'est pas nulle
            nomTache.text = tache.nom // On affiche le nom de la tâche
            nomDesc.text = tache.desc // On affiche la description de la tâche
            barreControle.title = tache.nom // On affiche le nom de la tâche dans la barre de navigation
            myDate.text = tache.convertDate() // On affiche la date de la tâche
        } else { // Sinon
            nomTache.text = "Erreur lors du chargement" // On affiche un message d'erreur
            nomDesc.text = "" // On affiche un message d'erreur
            barreControle.title = "Erreur" // On affiche un message d'erreur
            myDate.text = "Erreur" // On affiche un message d'erreur

        }

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
