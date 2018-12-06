//
//  SignUpViewController.swift
//  Login
//
//  Created by Usuario invitado on 16/10/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
   
    var nombres = [String]()
    var contraseñas = [String]()
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Password: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    @IBAction func Save(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if let valor = Name.text{
            nombres.append(valor)
            defaults.set(nombres, forKey: "nombre")
        }
        
        if let valor4 = Password.text{
            contraseñas.append(valor4)
            defaults.set(contraseñas, forKey: "contraseña")
        }
        print(nombres)
        print(contraseñas)

    }
    
}
