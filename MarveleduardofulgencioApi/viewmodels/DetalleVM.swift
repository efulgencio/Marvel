//
//  DetalleVM.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 8/01/2021.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

protocol DetalleVMViewDelegate: AnyObject
{
    func valorDidChange(viewModel: DetalleVM)
}


protocol DetalleVMCoordinadorDelegate: AnyObject
{
    func detalleViewModelDidEnd(_ viewModel: DetalleVM)
}

protocol DetalleVM
{
    var model: DetalleModel? { get set }
    var viewDelegate: DetalleVMViewDelegate? { get set }
    var coordinadorDelegate: DetalleVMCoordinadorDelegate? { get set}
    var detail: ProtocolItem? { get }
    func done()
}
