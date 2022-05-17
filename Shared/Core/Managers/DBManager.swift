//
//  DBManager.swift
//  Indomieku
//
//  Created by Alfin on 12/05/22.
//

import Foundation
import CoreData

protocol DBManagerProtocol {
    var container: NSPersistentContainer { get }

    static func getAll<T: NSFetchRequestResult>(entity entityName: String) -> [T]
    static func add(entity entityName: String, data: [String: Any]) -> Void
    static func clear(entity entityName: String) -> Void
}

final class DBManager: ObservableObject, DBManagerProtocol {
    internal let container = NSPersistentContainer(name: "Indomieku")

    static let shared = DBManager()

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

    static func getAll<T: NSFetchRequestResult>(entity entityName: String) -> [T] {
        let moc = DBManager.shared.container.viewContext

        let fetchRequest = NSFetchRequest<T>(entityName: entityName)

        return try! moc.fetch(fetchRequest)
    }

    static func add(entity entityName: String, data: [String: Any]) -> Void {
        let moc = DBManager.shared.container.viewContext

        let entity = NSEntityDescription.entity(forEntityName: entityName, in: moc)!
        let newData = NSManagedObject(entity: entity, insertInto: moc)

        for (key, value) in data {
            newData.setValue(value, forKeyPath: key)
        }

        try! moc.save()
    }

    static func clear(entity entityName: String) -> Void {
        let moc = DBManager.shared.container.viewContext

        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        try! moc.execute(deleteRequest)
    }
}
