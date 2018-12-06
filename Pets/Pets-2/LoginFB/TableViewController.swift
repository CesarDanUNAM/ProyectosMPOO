//
//  TableViewController.swift
//  LoginFB
//
//  Created by Usuario invitado on 11/13/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    

    var productos = ["Alimento","Cama","Cama2","Correa","Casa","Galletas","Gorro","Hueso","Impermeable","Minino","Pelota","Talco","Transportadora","Wiskas"]
    var precio = [200,500,400,150,1500,50,50,40,250,50,40,70,500,70]
    var desc = ["Alimento para perro. 1.5 kg", "Cama grande para perro/gato","Cama pequeña para perro/gato","Correa para perros de raza mediana","Casa grande de madera para perro", "Galletas para perro","Gorro navideño para mascota","Hueso de juguete para perro", "Impermeable para perro de raza mediana","Alimento para gato. 500 g","Pelota para perro", "Talco para perro/gato","Transportadora mediana para mascotas","Lata de alimento humedo para gato. 30 g" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = productos[indexPath.row]
        cell.imageView?.image = UIImage(named: productos[indexPath.row])
        
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            productos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let shareAction = UIContextualAction(style: .normal, title: "Compartir") { (action, sourcview, completion) in
            
            let defaultText = "Compartiendo mis compras"
            
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
            completion(true)
        }
        
        shareAction.backgroundColor = .green
        
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [shareAction])
        
        return swipeConfiguration
    }
    
    
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
 
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
        
    }*/
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let detail = segue.destination as! PetShopViewController
                detail.Producto = productos[indexPath.row]
                
                detail.Precio = precio[indexPath.row]
                detail.Desc = desc[indexPath.row]
                
                
            }
        }
    }
    
    
}
