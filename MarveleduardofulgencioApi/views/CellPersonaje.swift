//
//  CellPersonaje.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 18/5/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import UIKit

class CellPersonaje: UITableViewCell {

    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var imagenHablar: ImagenHablar!


    var item: ProtocolItem? {
        didSet {
            if let item = item {
                DispatchQueue.main.async {
                    self.lblNombre.text = item.nombre
                    self.imagenHablar.imagenView.image =  UIImage(named: item.imagen)
                }
            } else {
                DispatchQueue.main.async {
                    self.lblNombre.text = ""
                    self.imagenHablar.imagenView.image = nil
                }
            }
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}


