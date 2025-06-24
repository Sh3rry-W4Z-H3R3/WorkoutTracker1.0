import Foundation
import CoreData

class WorkoutViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var workoutName: String = "New Workout"
    
    private let viewContext: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.viewContext = context
    }

    func addExercise(name: String, muscleGroup: String) {
        let newExercise = Exercise(context: viewContext)
        newExercise.id = UUID()
        newExercise.name = name
        newExercise.muscleGroup = muscleGroup
        newExercise.isCustom = true // Assuming user-added exercises are custom
        
        exercises.append(newExercise)
    }

    func finishWorkout() {
        let newWorkout = Workout(context: viewContext)
        newWorkout.id = UUID()
        newWorkout.name = workoutName
        newWorkout.startDate = Date()
        newWorkout.endDate = Date() // This should be updated when the workout actually ends
        
        // Here we would associate the sets with the workout
        // For now, we'll just save the workout object itself

        do {
            try viewContext.save()
        } catch {
            // Handle the error appropriately
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
