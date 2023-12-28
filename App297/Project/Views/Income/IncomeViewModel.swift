//
//  IncomeViewModel.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI
import CoreData

final class IncomeViewModel: ObservableObject {

    @Published var incomeAmount: String = ""
    @Published var incomeDate: Date = Date()
    @Published var incomeName: String = ""
    
    @Published var incomes: [IncomeModel] = []
    @Published var currentTask: IncomeModel?

    @AppStorage("currency") var currency: String = "EURUSD"
    
    @Published var currencies: [String] = ["EUR/USD", "USD/JPY", "AUD/USD", "USD/CHF", "EUR/JPY", "EUR/GBP"]
    @Published var current_currency = ""
    
    func addIncome(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "IncomeModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "IncomeModel", into: context) as! IncomeModel
        
        sub.incomeAmount = Int16(Int(incomeAmount) ?? 0)
        sub.incomeName = incomeName
        sub.incomeDate = incomeDate

        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchIncome() {
        
        CoreDataStack.shared.modelName = "IncomeModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IncomeModel>(entityName: "IncomeModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.incomes = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.incomes = []
        }
    }
}
