//
//  UpperWrapper.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 12/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import Foundation

@propertyWrapper
struct UpperString {
    
    private var str: String = ""
    
    var wrappedValue: String {
        get { str }
        set { str = newValue.uppercased() }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
    
}
