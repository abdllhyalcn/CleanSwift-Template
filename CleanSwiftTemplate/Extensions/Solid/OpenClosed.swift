//
//  OpenClosed.swift
//  CleanSwiftTemplate
//
//  Created by Abdullah Yalçın on 1.04.2024.
//

import Foundation

class InvoicePersistence {
    let invoice: String
    init(invoice: String) {
        self.invoice = invoice
    }
    func saveInvoiceToFile(){
        //Create a file and save the invoice
    }
    func saveInvoiceToCoreData(){
        //Saves invoice to core data
    }
}

protocol InvoicePersistenceProtocol {
    func save(invoice: String)
}

class FilePersistence: InvoicePersistenceProtocol {
    func save(invoice: String) {
        
    }
}

class CoreDataPersistence: InvoicePersistenceProtocol {
    func save(invoice: String) {
        
    }
    
}
