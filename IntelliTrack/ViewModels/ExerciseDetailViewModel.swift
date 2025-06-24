import Foundation
import CoreData

class ExerciseDetailViewModel: ObservableObject {
    @Published var exercise: Exercise
    @Published var sets: [WorkoutSet] = []
    
    private let viewContext: NSManagedObjectContext

    init(exercise: Exercise, context: NSManagedObjectContext) {
        self.exercise = exercise
        self.viewContext = context
        fetchSets()
    }

    func fetchSets() {
        // We can fetch sets associated with the exercise here if they were persisted
        // For now, we'll just use the sets already in the exercise object if any
        if let existingSets = exercise.sets as? Set<WorkoutSet> {
            sets = existingSets.sorted { $0.timestamp ?? Date() < $1.timestamp ?? Date() }
        }
    }

    func addSet(reps: Int, weight: Double, setType: SetType) {
        let newSet = WorkoutSet(context: viewContext)
        newSet.id = UUID()
        newSet.reps = Int16(reps)
        newSet.weight = weight
        newSet.timestamp = Date()
        newSet.setType = setType
        newSet.exercise = exercise
        
        sets.append(newSet)
        
        // No need to save here, the parent context will handle it when the workout is finished.
    }
}
