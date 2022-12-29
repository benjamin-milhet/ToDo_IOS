//
//  TableViewCell.swift
//  ToDo
//
//  Created by Benjamin Milhet on 07/11/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var myNom: UILabel!
    @IBOutlet weak var myDesc: UILabel!
    @IBOutlet weak var myDate: UILabel!
    @IBOutlet weak var myCheck: UISwitch!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
