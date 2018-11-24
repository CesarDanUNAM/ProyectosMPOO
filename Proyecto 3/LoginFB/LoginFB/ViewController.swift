//
//  ViewController.swift
//  LoginFB
//
//  Created by Germán Santos Jaimes on 11/7/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginUser(_ sender: UIButton) {
        guard let correo = email.text,
            let pass = password.text else { return }
        
        Auth.auth().signIn(withEmail: correo, password: pass) { (data, error) in
            if let error = error{
                debugPrint(error.localizedDescription)
                self.showError()
            } else {
                self.performSegue(withIdentifier: "toLoginAccountVC", sender: nil )
            }
        }
        
    }
    func showError(){
        let errorAlert = UIAlertController(title: "Error", message: "Sus datos no son correctos", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        errorAlert.addAction(okAction)
        
        present(errorAlert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLoginAccountVC"{
            
            let user = Auth.auth().currentUser
            
            if let user = user {
                
                let UID = user.uid
                let mail = user.email
                let name = user.displayName
                print ("\\\\\\\\")
                print (UID)
                print (mail)
                print (name)
            }
            
            
            let destino = segue.destination as! LoginAccountViewController
            destino.vieneDeVista1 = (user?.displayName)!
        }
    }


}

    
