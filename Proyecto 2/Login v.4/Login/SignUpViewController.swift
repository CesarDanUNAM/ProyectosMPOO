//
//  SignUpViewController.swift
//  Login
//
//  Created by Usuario invitado on 16/10/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
   
    var deFirst : UserData!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Password: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let dato = defaults.object(forKey: "dato") as? String{
            Name.text = dato
        }
        if let dato2 = defaults.object(forKey: "dato2") as? String{
            FirstName.text = dato2
        }
        if let dato3 = defaults.object(forKey: "dato3") as? String {
            LastName.text = dato3
        }
        if let dato4 = defaults.object(forKey: "dato4") as? String{
             Password.text = dato4
        }

    }
    @IBAction func Save(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if let valor = Name.text{
            defaults.set(valor, forKey: "dato")
        }
        if let valor2 = FirstName.text{
            defaults.set(valor2, forKey: "dato2")
        }
        if let valor3 = LastName.text{
            defaults.set(valor3, forKey: "dato3")
        }
        if let valor4 = Password.text{
            defaults.set(valor4, forKey: "dato4")
        }
        deFirst = UserData(firsname: "\(Name.text!)", lastname: "\(FirstName.text!)", username: "\(LastName.text!)", password: "\(Password.text!)")
        print(deFirst)
        
        save.append(deFirst)
        
        print (save)
    }
    
}
