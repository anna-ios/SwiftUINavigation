//
//  Optional.swift
//  Tripster
//
//  Created by Viktor Kushnerov on 07.04.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var asStringOrEmpty: String {
        self ?? ""
    }
}

extension Optional where Wrapped == Int {
    var asStringOrEmpty: String {
        guard let val = self else { return "" }
        return String(describing: val)
    }
    
    var asIntOrZero: Int {
        guard let val = self else { return 0 }
        return val
    }
}

extension Optional {
    var string: String {
        String(describing: self)
    }
    
    var isNotNil: Bool {
        self != nil
    }
}
