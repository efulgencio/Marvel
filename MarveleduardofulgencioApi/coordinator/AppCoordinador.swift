//
//  AppCoordinador.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 30/4/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import UIKit

class AppCoordinador: Coordinador
{
    fileprivate let LISTADO_KEY: String  = "Listado"
    
    var window: UIWindow
    var coordinadores = [String:Coordinador]()
    
    init(window: UIWindow)
    {
        self.window = window
    }
    
    func inicializar()
    {
        mostrarListado()
    }
}


extension AppCoordinador: ListadoDelegate
{
    func mostrarListado()
    {
        let listado = Listado(window: window)
        coordinadores[LISTADO_KEY] = listado
        listado.delegate = self
        listado.inicializar()
    }
    
    func listadoDidFinish(listCoordinador listCoordinator: Listado)
    {
        coordinadores[LISTADO_KEY] = nil
    }
    
}
