//
//  CeldaTableViewCell.swift
//  Tienda
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Titulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
        
    }


}
