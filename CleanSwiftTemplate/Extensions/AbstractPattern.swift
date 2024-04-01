//
//  AbstractPattern.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

protocol AbstractFactory {
    func createProductA() -> AbstractProductA
}

protocol AbstractProductA {
    func usefulFunctionA() -> String
}

class AbstractClass: AbstractFactory, AbstractProductA {
    
    func createProductA() -> AbstractProductA {
        return self
    }
    
    func usefulFunctionA() -> String {
        return "It's useful function."
    }
    
}
