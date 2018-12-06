//
//  LoginAccountViewController.swift
//  LoginFB
//
//  Created by on 11/7/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import Firebase

class LoginAccountViewController: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    var vieneDeVista1 = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = vieneDeVista1
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutUser(_ sender: UIButton) {
        try! Auth.auth().signOut()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Salir(_ sender: Any) {
        try! Auth.auth().signOut()
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func PetShop(_ sender: UIButton) {
        let segunda = TableViewController()
        present(segunda, animated: true, completion: viewDidLoad)
    }
    
}
