//
//  BuilderPattern.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

private protocol Builder {
    func insertStringItem(item: String)
    func updateCounter(count: Int)
}

class Product {
    var stringList = [String]()
    var counter = 0
}

class ConcreteBuilder: Builder {
    private var product = Product()
    
    func insertStringItem(item: String) {
        product.stringList.append(item)
    }
    
    func updateCounter(count: Int) {
        product.counter = count
    }
    
    func getProduct() -> Product {
        return product
    }
    
    func resetProduct() {
        product = Product()
    }
}

class UsageClass {
    
    func buildProduct() {
        let builder = ConcreteBuilder()
        builder.insertStringItem(item: "something")
        builder.insertStringItem(item: "something2")
        builder.updateCounter(count: 4)
        let product = builder.getProduct()
    }
}
