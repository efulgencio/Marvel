//
//  ClassListadoVM.swift
//  MarveleduardofulgencioApi
//
//  Created by Eduardo Fulgencio on 1/5/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class ListadoVM: ProtocolListadoVM
{
    
    weak var viewDelegate: ListadoVMViewDelegate?
    weak var coordinatorDelegate: ListadoVMCoordinatorDelegate?
    var isLoad: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    init() {
        isLoad = BehaviorRelay(value: false)
    }
    
    fileprivate var items: [ProtocolItem]? {
        didSet {
            viewDelegate?.valoresDidChange(viewModel: self)
        }
    }

    var model: ListadoModelProtocol? {
        didSet {
            model?.getListCharacter({ (items) in
                self.items = items.results
            })
            isLoad = BehaviorRelay(value: false)
        }
    }
    
    var title: String {
        return "List"
    }
    
    var numberOfItems: Int {
        if let items = items {
            return items.count
        }
        return 0
    }
    
    func itemAtIndex(_ index: Int) -> ProtocolItem?
    {
        if let items = items , items.count > index {
            return items[index]
        }
        return nil
    }
    
    func useItemAtIndex(_ index: Int)
    {
        if let items = items, let coordinatorDelegate = coordinatorDelegate  , index < items.count {
            coordinatorDelegate.listadoVMDidSelectData(self, data: items[index])
        }
    }
}
