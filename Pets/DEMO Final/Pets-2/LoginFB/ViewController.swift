//
//  ViewController.swift
//  LoginFB
//
//  Created by Usuario invitado on 11/7/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        password.delegate = self
        email.delegate = self
        if let _ = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "toLoginAccountVC", sender: nil)
        } else {
            navigationController?.popToRootViewController(animated: true)
            
        }
        
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
        let errorAlert = UIAlertController(title: "Error", message: "Usuario no registrado", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        errorAlert.addAction(okAction)
        
        present(errorAlert, animated: true, completion: nil)
        
    }
    /*let triger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: true)
     let cont = UNMutableNotificationContent()
     cont.title = "Pets"
     cont.subtitle = " HOla"
     cont.body = "Haz iniciado tu recorrido"
     cont.sound = UNNotificationSound.default
     let request = UNNotificationRequest(identifier: "ZeldaNotification", content: cont, trigger: triger)
     UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
     UNUserNotificationCenter.current().add(request) { (error) in
     if let error = error{
     print("Error")
     }
     }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLoginAccountVC"{
            let user = Auth.auth().currentUser
            let destino = segue.destination as!
            LoginAccountViewController
            destino.vieneDeVista1 = (user?.displayName)!
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    

}

    
