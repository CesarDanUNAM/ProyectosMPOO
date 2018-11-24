//
//  LoginAccountViewController.swift
//  LoginFB
//
//  Created by Germán Santos Jaimes on 11/7/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit
import Firebase
class LoginAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
  
    
    @IBOutlet weak var dataTable: UITableView!
    
    private var usuarios = [firebaseData]()
    var userReference: CollectionReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = vieneDeVista1
        
        dataTable.delegate = self
        dataTable.dataSource = self
        userReference = Firestore.firestore().collection("users")
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        userReference.addSnapshotListener { (snapshot, error) in
            if let error = error{
                
                print("*************")
                debugPrint(error)
                print("**********")
            }else{
                self.usuarios.removeAll()
                for document in (snapshot?.documents)!{
                    // paso 1
                    print("*********************")
                    print(document.data())
                    print("********************")
                    
                    // paso 2
                    let data = document.data()
                    let Nombre = data["username"] as! String
                  
                    let documentId = document.documentID
                    
                    let newUser = firebaseData(nombre: Nombre, userUID: documentId )
                    self.usuarios.append(newUser)
                    
                }
                self.dataTable.reloadData()
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = dataTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserCell{
            cell.configureCell(user: usuarios[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    @IBOutlet weak var nombre: UILabel!
    
    var vieneDeVista1 = ""
    
    
    
    
    @IBAction func logoutUser(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

