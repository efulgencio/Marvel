//
//  Protocolitem.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 1/5/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

protocol ProtocolItem
{
    var id: Int {get}
    var nombre: String { get }
    var imagen: String { get }
    var descripcion: String {get set}
}
