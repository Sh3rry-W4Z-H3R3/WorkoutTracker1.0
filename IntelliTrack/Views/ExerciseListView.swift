import SwiftUI

// A simple struct to represent a selectable exercise in the list
struct SelectableExercise: Identifiable {
    let id = UUID()
    let name: String
    let muscleGroup: String
}

struct ExerciseListView: View {
    // Sample data - later this will come from Core Data
    let exercises = [
        SelectableExercise(name: "Bench Press", muscleGroup: "Chest"),
        SelectableExercise(name: "Squat", muscleGroup: "Legs"),
        SelectableExercise(name: "Deadlift", muscleGroup: "Back"),
        SelectableExercise(name: "Overhead Press", muscleGroup: "Shoulders"),
        SelectableExercise(name: "Barbell Row", muscleGroup: "Back"),
        SelectableExercise(name: "Pull Up", muscleGroup: "Back"),
        SelectableExercise(name: "Bicep Curl", muscleGroup: "Arms"),
        SelectableExercise(name: "Tricep Extension", muscleGroup: "Arms")
    ]
    
    // This closure will be called when an exercise is selected
    var onExerciseSelected: (SelectableExercise) -> Void
    
    // Environment variable to dismiss the view
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List(exercises) { exercise in
                Button(action: {
                    onExerciseSelected(exercise)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(exercise.name).font(.headline)
                            Text(exercise.muscleGroup).font(.subheadline).foregroundColor(.gray)
                        }
                        Spacer()
                        MuscleGroupView(muscleGroup: exercise.muscleGroup)
                            .frame(width: 50, height: 100)
                    }
                }
                .foregroundColor(.primary) // Ensure button text is visible
            }
            .navigationTitle("Select Exercise")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(onExerciseSelected: { _ in })
    }
}
