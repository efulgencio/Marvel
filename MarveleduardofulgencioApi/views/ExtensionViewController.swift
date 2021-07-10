//
//  ExtensionViewController.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 10/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String? = nil, message: String?, completion: (() -> Void)? = nil) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Alerta", style: .default) { _ in
            completion?()
        }
        controller.addAction(ok)
        present(controller, animated: true)
    }
}

