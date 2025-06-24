import Foundation
import CoreData

// Enum to define the different types of sets supported
public enum SetType: String, CaseIterable, Codable {
    case straight = "Straight Set"
    case drop = "Drop Set"
    case superset = "Super Set"
    case pyramid = "Pyramid Set"
    case myo = "Myo Reps"
    case restPause = "Rest-Pause"
}

@objc(WorkoutSet)
public class WorkoutSet: NSManagedObject {

}

extension WorkoutSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSet> {
        return NSFetchRequest<WorkoutSet>(entityName: "WorkoutSet")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var reps: Int16
    @NSManaged public var weight: Double
    @NSManaged public var timestamp: Date?
    @NSManaged public var rpe: Double // Rate of Perceived Exertion
    
    // Storing the enum as a String
    @NSManaged private var setTypeRaw: String?

    public var setType: SetType {
        get {
            guard let rawValue = setTypeRaw, let type = SetType(rawValue: rawValue) else {
                return .straight // Default value
            }
            return type
        }
        set {
            setTypeRaw = newValue.rawValue
        }
    }

    // Relationships
    @NSManaged public var exercise: Exercise?
    @NSManaged public var workout: Workout?

}

extension WorkoutSet : Identifiable {

}
