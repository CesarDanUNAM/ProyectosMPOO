//
//  SecodTableViewController.swift
//  LoginFB
//
//  Created by macbook  on 12/5/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class SecodTableViewController: UITableViewController {
    
    var nombre = ["CLÍNICA MÉDICA ANIMAL","CLÍNICA DE MASCOTAS ZOON","CLÍNICA VETERINARIA CANNYS","COOL PETS","CUENTA CONMIGO VETERINARIA","DOGS AND PETS","ESPECIALIDADES VETERINARIAS","HOSPITAL VETERIANO, S.A. DE C.V.","BOUTIQUE Y ESTETICA ANIMAL","CAN ÁNGELES","CENTRO INTEGRAL DE MASCOTAS","CENTRO VETERINARIO DOCTOR CHIHUAHUA","CONSULTORÍA DE ESPECIALIDADES VETERINARIAS","KINGAS PET VETERINARIA","CLÍNICA VETERINARIA DINO","CLÍNICA VETERINARIA KOMINO","CLÍNICA VETERINARIA SPATITAS","ESTÉTICA CANINA","SERVICIO VETERINARIO MV","KIOKETA","VETERINARIA Amroth","VETERINARIA AZTECAS","HOSPITAL VETERINARIO VET-CANES","VETERINARIA ESTÉTICA CANINA"]
    var latitud = [19.34958641,19.29804561,19.45392168,19.37017400,19.40845977,19.33992183,19.35794204,19.38359265,19.36231408,19.39923996,19.28330928,19.44969644,19.32376415,19.40844660,19.39035927,19.42705036,19.30311793,19.31477108,19.34472090,19.35976188,19.30360474,19.31542410,19.32700085,19.30567908,19.33361742]
    var longitud = [-99.13066754,-99.16584571,-99.17688364,-99.17159743,-99.13229729,-99.26338602,-99.20416504,-99.25091028,-99.18482601,-99.18425672,-99.12245859,-99.08326252,-99.09835850,-99.11515126,-99.10073152,-99.14696478,-99.23487002,-99.14516727,-99.00392339,-99.25343804,-99.17815484,-99.14730072,-99.15632613,-99.12558117,-99,16552513]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true

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
        return nombre.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda2", for: indexPath)
        cell.textLabel?.text = nombre[indexPath.row]
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
            nombre.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue2"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let detail = segue.destination as! VecteViewController
                
                detail.desecodview = nombre[indexPath.row]
                detail.latitud1 = latitud[indexPath.row]
                detail.longitud1 = longitud[indexPath.row]
            }
        }
    }

}
