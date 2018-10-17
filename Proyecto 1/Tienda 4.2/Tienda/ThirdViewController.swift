//
//  ThirdViewController.swift
//  Tienda
//
//  Created by Usuario invitado on 4/10/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var TotalC: UILabel!
    @IBOutlet weak var Table: UITableView!
    var Total: Double = 0
    var limpia: Bool = false

    //var Secciones = listaProduc
    override func viewDidLoad() {
        
        super.viewDidLoad()
        calculaTotal()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  listaProduc.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda2", for: indexPath)
        
        
        cell.textLabel?.text = "\(listaProduc[indexPath.row].nombre)- \(listaProduc[indexPath.row].precio)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceview, completionHandler) in
    
            listaProduc.remove(at: indexPath.row)
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
        for i in listaProduc{
            Total = i.precio + Total
            
        }
        TotalC.text = "Total = \(Total)"
    }

}
