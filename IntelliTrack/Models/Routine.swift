import Foundation
import CoreData

@objc(Routine)
public class Routine: NSManagedObject {

}

extension Routine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Routine> {
        return NSFetchRequest<Routine>(entityName: "Routine")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var routineDescription: String?

    // Relationship to exercises
    @NSManaged public var exercises: NSSet?

}

// MARK: Generated accessors for exercises
extension Routine {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: Exercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: Exercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}

extension Routine : Identifiable {

}
