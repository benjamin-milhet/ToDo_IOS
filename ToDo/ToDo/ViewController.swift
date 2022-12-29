//
//  ViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 07/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    @IBOutlet weak var myNavigation: UINavigationItem!
    
    var myData: [MyData] = []
    var myCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myNavigation.title = myCategory?.nom
        self.myData = self.myData.sorted(by: { $0.dateRendu < $1.dateRendu})
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        cell.myNom.text = myData[indexPath.row].nom
        cell.myDate.text = myData[indexPath.row].convertShortDate()
        cell.myCheck.isOn = myData[indexPath.row].isCheck
        cell.myCheck.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer la ToDo", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.myData.remove(at: row)
            completionHandler(true)
            self.myTableView.reloadData()
        })])
        
        return configuration
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = self.myTableView.indexPathForSelectedRow!.row
            vc.data = self.myData[row]
        }
    }
    
    @IBAction func Cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController {
            vc.dismiss(animated: true, completion: nil)
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func Save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController {
            if let addNewDataNom = vc.addNom, let addNewDataDesc = vc.addDesc, let addNewDataDate = vc.addDate {
                self.myData.append(MyData(_nom: addNewDataNom.text!, _desc: addNewDataDesc.text!, _date: addNewDataDate.date, _category: myCategory!))
                self.myData = myData.sorted(by: { $0.dateRendu < $1.dateRendu})
            }
            self.myTableView.reloadData()
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func changerIsCheck(_ sender: UISwitch) {
        let row = sender.tag
        self.myData[row].isCheck = sender.isOn
    }
}

