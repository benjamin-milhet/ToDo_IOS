//
//  AddViewController.swift
//  ToDo
//
//  Created by Benjamin Milhet on 29/11/2022.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var addNom: UITextField!
    @IBOutlet weak var addDesc: UITextField!
    
    var data: [MyData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        addNom.delegate = self
        addDesc.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
