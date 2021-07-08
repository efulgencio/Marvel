//
//  ClassDetalleModel.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 8/01/2021.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

class ClassDetalleModel: DetalleModel
{
    
    fileprivate var item: ProtocolItem?
    
    init(detailItem: ProtocolItem)
    {
        self.item = detailItem
    }
    
    func detalle(_ completionHandler: @escaping (_ item: ProtocolItem?) -> Void)
    {
        DispatchQueue.global().async {
            completionHandler(self.item)
        }
    }
    
}
