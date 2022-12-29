//
//  DetailViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 29/11/2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nomTache: UILabel!
    @IBOutlet weak var nomDesc: UILabel!
    @IBOutlet weak var barreControle: UINavigationItem!
    @IBOutlet weak var myDate: UILabel!
    
    var data: MyData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tache = data {
            nomTache.text = tache.nom
            nomDesc.text = tache.desc
            barreControle.title = tache.nom
            myDate.text = tache.convertDate()
        } else {
            nomTache.text = "Erreur lors du chargement"
            nomDesc.text = ""
            barreControle.title = "Erreur"
            myDate.text = "Erreur"

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
