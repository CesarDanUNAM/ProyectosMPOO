//
//  SecondViewController.swift
//  Tienda
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var devista1: productos = productos(nombre : "" ,precio : 0.0, imagen: "")
    
    
    @IBAction func Carrito(_ sender: UIButton) {
        listaProduc.append(devista1)
        print( listaProduc)
        
        
    }
    
    
    @IBOutlet weak var Precio: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var Titulo2: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Titulo2.text = devista1.nombre
        Precio.text = devista1.precio.description
        imagen.image = UIImage (named: devista1.imagen)
}
    
    
}
