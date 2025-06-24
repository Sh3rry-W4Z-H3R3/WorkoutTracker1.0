import Foundation
import CoreData

@objc(Workout)
public class Workout: NSManagedObject {

}

extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var notes: String?

    // Relationship to sets
    @NSManaged public var sets: NSSet?

    // Convenience property for duration
    public var duration: TimeInterval {
        guard let start = startDate, let end = endDate else {
            return 0
        }
        return end.timeIntervalSince(start)
    }
}

// MARK: Generated accessors for sets
extension Workout {

    @objc(addSetsObject:)
    @NSManaged public func addToSets(_ value: WorkoutSet)

    @objc(removeSetsObject:)
    @NSManaged public func removeFromSets(_ value: WorkoutSet)

    @objc(addSets:)
    @NSManaged public func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged public func removeFromSets(_ values: NSSet)

}

extension Workout : Identifiable {

}
