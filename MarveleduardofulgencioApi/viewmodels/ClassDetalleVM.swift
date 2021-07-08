//
//  ClassDetalleVM.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 8/01/2021.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

class ClassDetalleVM: DetalleVM
{
    weak var viewDelegate: DetalleVMViewDelegate?
    weak var coordinadorDelegate: DetalleVMCoordinadorDelegate?
    
    fileprivate(set) var detail: ProtocolItem? {
        didSet {
            viewDelegate?.valorDidChange(viewModel: self)
        }
    }
    
    var model: DetalleModel? {
        didSet {
            model?.detalle({ (item) in
                self.detail = item
            })
        }
    }
    
    func done() {
        coordinadorDelegate?.detalleViewModelDidEnd(self)
    }
    
}
