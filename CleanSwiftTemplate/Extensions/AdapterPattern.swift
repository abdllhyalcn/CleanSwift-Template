//
//  AdapterPattern.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

class Target {
    func request() -> String {
        return "Target: The default target's behavior."
    }
}

class Adaptee {
    public func specificRequest() -> String {
        return ".eetpadA eht fo roivaheb laicepS"
    }
}

class Adapter: Target {
    private let adaptee: Adaptee
    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    override func request() -> String {
        return "Adapter: (TRANSLATED) \(adaptee.specificRequest())"
    }
}
