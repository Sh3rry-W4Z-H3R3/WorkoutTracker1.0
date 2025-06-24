import SwiftUI
import CoreData

struct ExerciseDetailView: View {
    @StateObject private var viewModel: ExerciseDetailViewModel
    @State private var isShowingAddSetView = false

    init(exercise: Exercise, context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: ExerciseDetailViewModel(exercise: exercise, context: context))
    }

    var body: some View {
        VStack {
            // A list to display the sets for this exercise
            List {
                ForEach(viewModel.sets) { workoutSet in
                    HStack {
                        Text("Set \(viewModel.sets.firstIndex(of: workoutSet)! + 1)")
                        Spacer()
                        Text("\(workoutSet.reps) reps")
                        Spacer()
                        Text("\(workoutSet.weight, specifier: "%.1f") kg")
                    }
                }
            }

            Button(action: {
                isShowingAddSetView = true
            }) {
                Text("Add Set")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle(viewModel.exercise.name ?? "Exercise")
        .sheet(isPresented: $isShowingAddSetView) {
            AddSetView { reps, weight, setType in
                viewModel.addSet(reps: reps, weight: weight, setType: setType)
            }
        }
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let sampleExercise = Exercise(context: context)
        sampleExercise.name = "Bench Press"
        
        return NavigationView {
            ExerciseDetailView(exercise: sampleExercise, context: context)
        }
    }
}
