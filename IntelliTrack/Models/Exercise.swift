import Foundation
import CoreData

@objc(Exercise)
public class Exercise: NSManagedObject {

}

extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var muscleGroup: String? // e.g., "Chest", "Legs", "Back"
    @NSManaged public var exerciseDescription: String?
    @NSManaged public var isCustom: Bool
    
    // Relationship to sets
    @NSManaged public var sets: NSSet?

}

// MARK: Generated accessors for sets
extension Exercise {

    @objc(addSetsObject:)
    @NSManaged public func addToSets(_ value: WorkoutSet)

    @objc(removeSetsObject:)
    @NSManaged public func removeFromSets(_ value: WorkoutSet)

    @objc(addSets:)
    @NSManaged public func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged public func removeFromSets(_ values: NSSet)

}

extension Exercise : Identifiable {

}
