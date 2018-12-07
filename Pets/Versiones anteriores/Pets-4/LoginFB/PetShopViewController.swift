//
//  PetShopViewController.swift
//  LoginFB
//
//  Created by Usuario invitado on 11/13/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class PetShopViewController: UIViewController {
    @IBOutlet weak var Imagen: UIImageView!
    
    @IBOutlet weak var Texto: UILabel!
    @IBOutlet weak var PreTex: UILabel!
    var Producto: String = ""
    var Precio: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.magenta
        guard let Cat = UIImage(named: Producto) else { return }
        guard Cat.cgImage != nil else { return }
        Imagen.image = Cat
        Imagen.contentMode = .scaleToFill
        Texto.text = Producto
        Imagen.image = UIImage( named: Producto)
        PreTex.text = Precio
        

    }
}
