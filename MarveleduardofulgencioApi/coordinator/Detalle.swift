//
//  Detalle.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 8/01/2021.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import UIKit

protocol DetalleCoordinatorDelegate: AnyObject
{
    func detalleCoordinatorDidFinish(detailCoordinator: Detalle)
}

class Detalle: Coordinador
{
    weak var delegate: DetalleCoordinatorDelegate?
    let dataItem: ProtocolItem
    var window: UIWindow
    
    init(window: UIWindow, dataItem: ProtocolItem)
    {
        self.window = window
        self.dataItem = dataItem
    }
    
    func inicializar()
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "Detalle") as? DetalleVC {
            let viewModel = DetalleVM()
            viewModel.model = DetalleModel(detailItem: dataItem)
            viewModel.coordinadorDelegate = self
            vc.viewModel = viewModel
            window.rootViewController = vc
        }
        
    }
}

extension Detalle: DetalleVMCoordinadorDelegate
{
    
    func detalleViewModelDidEnd(_ viewModel: DetalleVM)
    {
        delegate?.detalleCoordinatorDidFinish(detailCoordinator: self)
    }
    
}
 
 
 
 
 
 
 
 
