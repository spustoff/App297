//
//  WorkDayViewModel.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI
import CoreData

final class WorkDayViewModel: ObservableObject {

    @Published var notName: String = ""
    @Published var notDate: Date = Date()
    @Published var notWF: Date = Date()
    @Published var notWT: Date = Date()
    @Published var nowDate: Date = Date()
    
    @Published var notes: [NotesModel] = []

    func addNote(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "NotesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "NotesModel", into: context) as! NotesModel
        
        sub.notName = notName
        sub.notDate = notDate
        sub.notWF = notWF
        sub.notWT = notWT
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchNotes() {
        
        CoreDataStack.shared.modelName = "NotesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesModel>(entityName: "NotesModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.notes = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.notes = []
        }
    }
}

