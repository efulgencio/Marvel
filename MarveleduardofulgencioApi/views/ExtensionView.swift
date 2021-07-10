//
//  ExtensionView.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 10/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import UIKit


class ViewBase<T: UIView> {
    
    let view: T
    
    init(view: T) {
        self.view = view
    }
}

extension ViewBase where T: UIButton {
    func changeTitle(to title: String) {
        view.setTitle(title, for: .normal)
    }
}

extension ViewBase where T: UILabel {
    func changeFont(to font: UIFont) {
        view.font = font
    }
}
