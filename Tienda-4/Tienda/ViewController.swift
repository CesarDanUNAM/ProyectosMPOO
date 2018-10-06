//
//  ViewController.swift
//  Tienda
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var Table: UITableView!
    
    var Secciones = [productos] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Secciones.append(productos(nombre: "Balon", precio: 13.2, imagen: "Balon"))
        
        Secciones.append(productos(nombre: "Playera", precio: 14.2, imagen: "Playera"))
        
        Secciones.append(productos(nombre: "Tennis", precio: 80.5, imagen: "Tennis"))
        
        Secciones.append(productos(nombre: "Gorras", precio: 30, imagen: "Gorras"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Secciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaTableViewCell
        
        cell.textLabel?.text = "\(Secciones[indexPath.row].nombre)"
        
        return cell
    }
    //Para Agregar La Palomita
    
    /*func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(Secciones[indexPath.count])
        
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.accessoryType = .checkmark
        
    }*/
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceview, completionHandler) in
            
            self.Secciones.remove(at: indexPath.row)
            self.Table.deleteRows(at: [indexPath], with: .fade )
            completionHandler(true)
        }
        
       /* let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceview, completionHandler) in
            
            let defaultTex = "Compartiendo a: \(self.Secciones[indexPath.row])"
            
            let activityController = UIActivityViewController(activityItems: [defaultTex], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
            completionHandler(true)
        }*/
        
        //shareAction.backgroundColor = UIColor.green
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        
        return swipeConfiguration
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segunda"{
            
            let indexPath = Table.indexPathForSelectedRow
            
            let destino = segue.destination as! SecondViewController
            
            destino.devista1 = Secciones[(indexPath?.row)!]
        }
        
    }
    

    
    
    @IBAction func unwindSecondView( segue: UIStoryboardSegue){
        
    }

}

