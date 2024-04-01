//
//  DecoratorPattern.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

protocol Component {
    
    func operation() -> String
}

class ConcreteComponent: Component {

    func operation() -> String {
        return "ConcreteComponent"
    }
}

class Decorator: Component {
    private var component: Component
    
    init(_ component: Component) {
        self.component = component
    }
    
    func operation() -> String {
        return component.operation()
    }
}

class ConcreteDecoratorA: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorA(" + super.operation() + ")"
    }
}

class ConcreteDecoratorB: Decorator {

    override func operation() -> String {
        return "ConcreteDecoratorB(" + super.operation() + ")"
    }
}


