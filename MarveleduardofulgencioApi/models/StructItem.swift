//
//  ClassDataItem.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 1/5/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

struct StructItem: ProtocolItem
{
    var id = 0
    var nombre = ""
    var imagen = ""
    var formatImg = ""
    var descripcion = ""
    var mensaje = ""
    var finalyImage: String {
        get {
           return imagen + "." + formatImg
        }
    }
    
    init(cadenainicio: String)
    {
        let componentes = cadenainicio.components(separatedBy: ":")
        self.id = 0
        if componentes.count == 4 {
            self.nombre = componentes[0]
            self.imagen = componentes[1]
            self.descripcion = componentes[2]
            self.mensaje = componentes[3]
        } else {
            self.nombre = "."
            self.imagen = "."
            self.descripcion = "."
            self.mensaje = "."
        }
    }
    
    init(character: NSDictionary) {
        self.id = character[PathJson.characterId.rawValue]! as! Int
        self.nombre = character[PathJson.characterName.rawValue]! as! String
        self.imagen = character.value(forKeyPath: PathJson.thumbnailPath.rawValue)! as! String
        self.formatImg = character.value(forKeyPath: PathJson.thumbnailExtension.rawValue)! as! String
        self.descripcion = "."
        self.mensaje = "."

    }
    
}

