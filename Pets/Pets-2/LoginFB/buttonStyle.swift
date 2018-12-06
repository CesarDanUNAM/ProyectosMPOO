//
//  buttonStyle.swift
//  LoginFB
//
//  Created by macbook  on 12/4/18.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import UIKit

class styleButton: UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 9.00
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3.00
        
    }
}

