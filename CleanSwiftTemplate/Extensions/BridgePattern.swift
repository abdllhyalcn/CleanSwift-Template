//
//  BridgePattern.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

class Abstraction {
    
    private var operation = 0
    func operate() -> String {
        return "Abstraction: Base operation with:\n" + String(operation)
    }
}

class ExtendedAbstraction: Abstraction {
    
    override func operate() -> String {
        return super.operate() + "Extended"
    }
}
