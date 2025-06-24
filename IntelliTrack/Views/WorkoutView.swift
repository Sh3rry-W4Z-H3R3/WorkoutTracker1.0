import SwiftUI
import CoreData

struct WorkoutView: View {
    @StateObject private var viewModel: WorkoutViewModel
    
    // State to control the presentation of the exercise list sheet
    @State private var isShowingExerciseList = false
    
    // Store the context to pass it down to child views
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: WorkoutViewModel(context: context))
        self.viewContext = context
    }

    var body: some View {
        NavigationView {
            VStack {
                // List of exercises from the ViewModel
                List {
                    ForEach(viewModel.exercises) { exercise in
                        NavigationLink(destination: ExerciseDetailView(exercise: exercise, context: viewContext)) {
                            Text(exercise.name ?? "Unnamed Exercise")
                        }
                    }
                }
                
                Spacer()
                
                Button(action: {
                    // Show the exercise list sheet
                    isShowingExerciseList = true
                }) {
                    Text("Add Exercise")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle($viewModel.workoutName)
            .navigationBarItems(trailing: Button("Finish") {
                viewModel.finishWorkout()
            })
            .sheet(isPresented: $isShowingExerciseList) {
                // Present the ExerciseListView
                ExerciseListView { selectedExercise in
                    // This closure is called when an exercise is selected
                    viewModel.addExercise(name: selectedExercise.name, muscleGroup: selectedExercise.muscleGroup)
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        // For previews, we use the in-memory persistence controller
        WorkoutView(context: PersistenceController.preview.container.viewContext)
    }
}
