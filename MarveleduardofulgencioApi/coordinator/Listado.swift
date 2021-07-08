//
//  Listado.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 30/4/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import UIKit


protocol ListadoDelegate: AnyObject
{
    func listadoDidFinish(listCoordinador: Listado)
}

class Listado: Coordinador
{
    
    init(window: UIWindow)
    {
        self.window = window
    }
    
    weak var delegate: ListadoDelegate?
    var detalleCoordinador: Detalle?
    var window: UIWindow
    var listViewController: ListadoTVC?
    
    func inicializar()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        listViewController = storyboard.instantiateViewController(withIdentifier: "Listado") as? ListadoTVC
        
        guard let listViewController = listViewController else { return }
        
        let viewModel =  ClassListadoVM()
        viewModel.model = ClassListadoModel()
        viewModel.coordinatorDelegate = self
        listViewController.viewModel = viewModel
        window.rootViewController = listViewController
    }
}


extension Listado: ListadoVMCoordinatorDelegate
{
    func listadoVMDidSelectData(_ viewModel: ListadoVM, data: ProtocolItem)
    {
        detalleCoordinador = Detalle(window: window, dataItem: data)
        detalleCoordinador?.delegate = self
        detalleCoordinador?.inicializar()
    }
}


extension Listado: DetalleCoordinatorDelegate
{
    func detalleCoordinatorDidFinish(detailCoordinator: Detalle)
    {
        self.detalleCoordinador = nil
        window.rootViewController = listViewController
    }
}
