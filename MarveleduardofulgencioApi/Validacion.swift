//
//  Validacion.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 12/01/2021.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

enum ValidationError: Error {
    case NotExist
}


class Validation {
    
    func validate(text: String) throws -> Void {
        if text.contains(ErrorImageNotExist.message.rawValue) {
            throw ValidationError.NotExist
        }
    }
    
}
