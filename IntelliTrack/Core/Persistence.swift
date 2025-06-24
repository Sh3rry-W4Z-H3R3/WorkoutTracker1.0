import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // A container that encapsulates the Core Data stack in our app
    let container: NSPersistentContainer

    // An initializer to load Core Data, optionally using an in-memory store for previews or tests
    init(inMemory: Bool = false) {
        // The name "IntelliTrack" here must match the name of your .xcdatamodeld file
        container = NSPersistentContainer(name: "IntelliTrack")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                // This is a serious error for a production app.
                // Replace this implementation with code to handle the error appropriately.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // A convenience function for SwiftUI previews
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        // Create sample data for previews here if needed
        // For example:
        // let newItem = Item(context: viewContext)
        // newItem.timestamp = Date()
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
