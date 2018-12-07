//
//  CreateAccountViewController.swift
//  LoginFB
//
//  Created by  on 11/7/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import Firebase


class CreateAccountViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.delegate = self
        email.delegate = self
        password.delegate = self
    
    }
    

    @IBAction func backToLogin(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func createAccount(_ sender: UIButton) {
        guard let correo = email.text,
            let pass = password.text,
            let username = nombre.text else { return }
        print(correo)
        Auth.auth().createUser(withEmail: correo, password: pass) { (data, error) in
            if let error = error{
                debugPrint(error.localizedDescription)
                self.showError()

            }
            
            let user = data?.user
            let changeRequest = user?.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if let error = error{
                    debugPrint(error.localizedDescription)

                }
            })
            
            guard let userId = user?.uid else { return }
            
            Firestore.firestore().collection("users").document(userId).setData([
                "username" : username,
                "date_created": FieldValue.serverTimestamp()
                ], completion: { (error) in
                if let error = error {
                    debugPrint(error)
                }else{
                    self.navigationController?.popViewController(animated: true)
                    }
            })
        }
    
    }
    func showError(){
        let errorAlert = UIAlertController(title: "Error", message: "Sus datos no son correctos", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        errorAlert.addAction(okAction)
        
        present(errorAlert, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}
