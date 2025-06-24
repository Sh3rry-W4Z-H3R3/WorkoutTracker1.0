import SwiftUI
import CoreData

struct WorkoutHistoryDetailView: View {
    let workout: Workout

    var body: some View {
        List {
            Section(header: Text("Workout Summary")) {
                Text("Name: \(workout.name ?? "Unnamed Workout")")
                Text("Date: \(workout.startDate ?? Date(), formatter: detailDateFormatter)")
                Text("Duration: \(formattedDuration(workout.duration))")
            }
            
            Section(header: Text("Exercises")) {
                // We need a way to get the exercises from the sets
                // This is a computed property we can add
                ForEach(Array(workout.sets as? Set<WorkoutSet> ?? []), id: \.self) { workoutSet in
                    VStack(alignment: .leading) {
                        Text(workoutSet.exercise?.name ?? "Unknown Exercise").font(.headline)
                        HStack {
                            Text("\(workoutSet.reps) reps at \(workoutSet.weight, specifier: "%.1f") kg")
                            Spacer()
                            let e1RM = FitnessCalculators.estimatedOneRepMax(weight: workoutSet.weight, reps: workoutSet.reps)
                            Text("e1RM: \(e1RM, specifier: "%.1f") kg")
                                .foregroundColor(.gray)
                        }
                        .font(.subheadline)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("Workout Details")
    }
    
    private func formattedDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: duration) ?? "0s"
    }
}

private let detailDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()

struct WorkoutHistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let workout = Workout(context: context)
        workout.name = "Full Body Workout"
        workout.startDate = Date()
        workout.endDate = Date().addingTimeInterval(3600)
        
        let exercise = Exercise(context: context)
        exercise.name = "Squat"
        
        let set1 = WorkoutSet(context: context)
        set1.reps = 10
        set1.weight = 100
        set1.exercise = exercise
        
        let set2 = WorkoutSet(context: context)
        set2.reps = 8
        set2.weight = 110
        set2.exercise = exercise
        
        workout.addToSets([set1, set2])
        
        return NavigationView {
            WorkoutHistoryDetailView(workout: workout)
        }
    }
}
