//
//  ViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 07/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    
    var myData: [MyData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 1...6 {
            let nom = "Tâche : " + String(i)
            let desc = "Ceci est une description de la tâche " + String(i)
            let date = Date()
            let d = MyData(_nom: nom, _desc: desc, _date: date)
            myData.append(d)
        }
        
        
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        cell.myNom.text = myData[indexPath.row].nom
        cell.myCheck.isOn = myData[indexPath.row].isCheck
        cell.myCheck.tag = indexPath.row
        cell.myDelete.tag = indexPath.row
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = myTableView.indexPathForSelectedRow!.row
            vc.data = myData[row]
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
                myData.append(MyData(_nom: addNewDataNom.text!, _desc: addNewDataDesc.text!, _date: addNewDataDate.date))
            }
            myTableView.reloadData()
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func changerIsCheck(_ sender: UISwitch) {
        let row = sender.tag
        myData[row].isCheck = sender.isOn
    }
    
    @IBAction func deleteData(_ sender: UIButton) {
        let row = sender.tag
        myData.remove(at: row)
        myTableView.reloadData()
    }
    
    
    


}

