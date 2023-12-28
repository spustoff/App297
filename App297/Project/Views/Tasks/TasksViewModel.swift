//
//  TasksViewModel.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI
import CoreData

final class TasksViewModel: ObservableObject {
    
    @Published var taskName: String = ""
    @Published var taskTime: Date = Date()
    @Published var taskTag: String = ""
    @Published var taskDescription: String = ""
    @Published var taskNotes: String = ""
    
    @Published var tasks: [TasksModel] = []
    @Published var currentTask: TasksModel?

    func addTask(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "TasksModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "TasksModel", into: context) as! TasksModel
        
        sub.taskName = taskName
        sub.taskTime = taskTime
        sub.taskTag = taskTag
        sub.taskDescription = taskDescription
        sub.taskNotes = taskNotes

        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchTasks() {
        
        CoreDataStack.shared.modelName = "TasksModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TasksModel>(entityName: "TasksModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.tasks = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.tasks = []
        }
    }
}

