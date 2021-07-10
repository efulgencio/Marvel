//
//  ClassLIstadoModel.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 1/5/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

class ListadoModel: ListadoModelProtocol
{
    
    fileprivate var items = [ProtocolItem]()
    
    init(){}
    
    func getListCharacter(_ completionHandler: @escaping (_ items: ApiServiceResults) -> Void)
    {
        ApiService.getListCharacter { result in
            switch result {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                case .success(let results):
                    completionHandler(results)
                }
        }
    }

}
   
