//
//  CategoryViewController.swift
//  ToDo
//
//  Created by Flore Milhet on 29/12/2022.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var myCategoryTableView: UITableView!
    @IBOutlet weak var myCategorySearchBar: UISearchBar!
    
    var myCategory: [Category] = []
    var myRechercheCategory: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCategory.append(Category(_nom: "Travail"))
        self.myCategory.append(Category(_nom: "Maison"))
        
        self.myRechercheCategory = self.myCategory
        
        self.myCategoryTableView.dataSource = self
        self.myCategoryTableView.delegate = self
        self.myCategorySearchBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myRechercheCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        cell.myNom.text = self.myRechercheCategory[indexPath.row].nom
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            let deleteCategory = self.myRechercheCategory[row]
            self.myCategory = self.myCategory.filter(){$0 !== deleteCategory}
            completionHandler(true)
            self.myRechercheCategory = self.myCategory
            self.myCategorySearchBar.text = ""
            self.myCategoryTableView.reloadData()
        })])
        
        return configuration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let row = self.myCategoryTableView.indexPathForSelectedRow!.row
            vc.myCategory = self.myRechercheCategory[row]
            vc.myData = self.myRechercheCategory[row].myData
        }
    }
    
    @IBAction func Cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddCategoryViewController {
            vc.dismiss(animated: true, completion: nil)
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddCategoryViewController {
            if let addNewCategoryNom = vc.addNom {
                self.myCategory.append(Category(_nom: addNewCategoryNom.text!))
                self.myRechercheCategory = self.myCategory
            }
            self.myCategoryTableView.reloadData()
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.myRechercheCategory = []
        
        if searchText == "" {
            self.myRechercheCategory = self.myCategory
        } else {
            for category in myCategory {
                if category.nom.uppercased().contains(searchText.uppercased()) {
                    self.myRechercheCategory.append(category)
                }
            }
        }
        
        self.myCategoryTableView.reloadData()
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
