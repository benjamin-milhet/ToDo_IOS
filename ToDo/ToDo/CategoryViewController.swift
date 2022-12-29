//
//  CategoryViewController.swift
//  ToDo
//
//  Created by Flore Milhet on 29/12/2022.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myCategoryTableView: UITableView!
    
    var myCategory: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCategory.append(Category(_nom: "Travail"))
        self.myCategory.append(Category(_nom: "Maison"))
        
        myCategoryTableView.dataSource = self
        self.myCategoryTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        cell.myNom.text = self.myCategory[indexPath.row].nom
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer la ToDo", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.myCategory.remove(at: row)
            completionHandler(true)
            self.myCategoryTableView.reloadData()
        })])
        
        return configuration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let row = self.myCategoryTableView.indexPathForSelectedRow!.row
            vc.myCategory = self.myCategory[row]
            vc.myData = self.myCategory[row].myData
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
            }
            self.myCategoryTableView.reloadData()
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func deleteCategory(_ sender: UIButton) {
        let row = sender.tag
        self.myCategory.remove(at: row)
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
