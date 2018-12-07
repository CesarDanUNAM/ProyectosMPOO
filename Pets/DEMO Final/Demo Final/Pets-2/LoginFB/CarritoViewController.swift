//
//  CarritoViewController.swift
//  LoginFB
//
//  Created by MacBook on 12/5/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class CarritoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    

    @IBOutlet weak var Table: UITableView!
    
    @IBOutlet weak var Total1: UILabel!
    var Total: Double = 0
    var limpia: Bool = false
    


    override func viewDidLoad() {
        super.viewDidLoad()
        calculaTotal()
        print(listaProduct.count)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  listaProduct.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda3", for: indexPath)
        
        cell.textLabel?.text = "\(listaProduct[indexPath.row])- \(listaPrecio[indexPath.row])"
        cell.imageView?.image = UIImage(named: listaProduct[indexPath.row])

        return cell
    }
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceview, completionHandler) in
            
            listaProduct.remove(at: indexPath.row)
            listaPrecio.remove(at: indexPath.row)
            self.limpia = true
            self.Table.deleteRows(at: [indexPath], with: .fade )
            completionHandler(true)
            self.calculaTotal()
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        
        return swipeConfiguration
        
        
    }
    
   func calculaTotal() {
        Total = 0
        for i in listaPrecio{
            Total = i + Total
            
        }
    Total1.text = "Total = \(Total)"
    
    print (Total1)
    }
    

   
    
    
}
