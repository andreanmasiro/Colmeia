//
//  Array+Nil.swift
//  Colmeia
//
//  Created by André Marques da Silva Rodrigues on 06/01/17.
//  Copyright © 2017 Vergil. All rights reserved.
//

import Foundation

extension Array {
    
    func noneNil() -> Bool {
        return self.count == (self.flatMap { $0 }).count
    }
    
    func allNil() -> Bool {
        return (self.flatMap { $0 }).count == 0
    }
}
