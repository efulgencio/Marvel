//
//  ClassLIstadoModel.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 1/5/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

class ClassListadoModel: ListadoModelProtocol
{
    
    fileprivate var items = [ProtocolItem]()
    
    init() {}
    
    func getListCharacter(_ completionHandler: @escaping (_ items: [ProtocolItem]) -> Void)
    {
        ApiService.getListCharacter { (result, error) in
            completionHandler(result!)
        }
    }

}
   
