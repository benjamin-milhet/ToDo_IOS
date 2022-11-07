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
            let d = MyData(nom: nom, desc: desc)
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
        cell.myDesc.text = myData[indexPath.row].desc
        
        return cell
    }
    
    


}

