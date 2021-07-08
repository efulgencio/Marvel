//
//  UIImageViewExtension.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 10/01/2021.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
