//
//  LoginAccountViewController.swift
//  LoginFB
//
//  Created by Germán Santos Jaimes on 11/7/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class LoginAccountViewController: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutUser(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
