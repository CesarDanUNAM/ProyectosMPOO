//
//  ViewController.swift
//  Login
//
//  Created by Usuario invitado on 9/10/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nombresEntrada = [String]()
    var contraseñasEntrada = [String]()
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!

    
    
    @IBAction func SignUp(_ sender: UIButton) {
        if nombresEntrada == [""] {
            showError()
        }else{
            for x in nombresEntrada{
                if x == Username.text {
                    for y in contraseñasEntrada{
                        if y == Password.text{
                            performSegue(withIdentifier: "segue2", sender: self)
                        }
                    }
                    
                }
                
            }
        }
        
    showError()
    }
    

    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        nombresEntrada = defaults.object(forKey: "nombre") as? [String] ?? [String]()
        print(nombresEntrada)
        contraseñasEntrada = defaults.object(forKey: "contraseña") as? [String] ?? [String]()
      
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1" {
            let destino = segue.destination as! SignUpViewController
            destino.nombres = nombresEntrada
            destino.contraseñas = contraseñasEntrada
        }
    
        
    }
    
  
   
    
    func showError() {
        let errorAlert = UIAlertController(title: "Error", message: "No se encuenra registrado", preferredStyle: .alert )
        let okaction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        errorAlert.addAction(okaction)
        present( errorAlert,animated: true, completion: nil)
    }
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        viewDidLoad()
    }

    
}


