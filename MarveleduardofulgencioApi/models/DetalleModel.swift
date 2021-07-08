//
//  DetailModel.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 8/01/2021.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

protocol DetalleModel
{
    func detalle(_ completionHandler: @escaping (_ item: ProtocolItem?) -> Void)
}
