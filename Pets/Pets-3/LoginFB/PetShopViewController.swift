//
//  PetShopViewController.swift
//  LoginFB
//
//  Created by Usuario invitado on 11/13/18.
//  Copyright © 2018 Germán Santos Jaimes. All rights reserved.
//

import UIKit

class PetShopViewController: UIViewController {
    @IBOutlet weak var Imagen: UIImageView!
    @IBOutlet weak var Texto: UILabel!
    var Producto: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Texto.text = Producto
        Imagen.image = UIImage(named: Producto)

    }
}
