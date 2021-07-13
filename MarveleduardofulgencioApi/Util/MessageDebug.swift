//
//  PrintDebug.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 13/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import Foundation

struct MessageDebug {
    let version: String
    
    func callAsFunction(message: String)  {
        debugPrint(message + " \(version)")
    }
    
    func callAsFunction() -> String {
        return "Versión: \(version)"
    }
}

