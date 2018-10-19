//
//  ViewController.swift
//  Login
//
//  Created by Usuario invitado on 9/10/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    var Users : [UserData] = [UserData(firsname: "", lastname: "", username: "", password: "") ]

    
    
    @IBAction func SignUp(_ sender: UIButton) {
        
        var validate: Bool = true
        if let Username = Username.text, let password = Password.text {
        
            for userdata in Users{
                if Username == userdata.username , password == userdata.password{
                    print("Usuario no valido")
                    //shouldPerformSegue(withIdentifier: "celda", sender: self)
                    break
                }else {
                    validate = false
                }
            }
        }
        if !validate{
            showError ()
            
        }
        Username.becomeFirstResponder()
        Password.resignFirstResponder()
        
    }
    

    override func viewDidLoad() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "celda"{
           
            print("ejecutando")
            
        }
        
    }
  
   /* override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "celda"{
            return true
        }
        else{
            return false
        }
    }*/
    
    func showError() {
        let errorAlert = UIAlertController(title: "Error", message: "No se encuenra registrado", preferredStyle: .alert )
        let okaction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        errorAlert.addAction(okaction)
        present( errorAlert,animated: true, completion: nil)
    }
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        
    }

    
}


