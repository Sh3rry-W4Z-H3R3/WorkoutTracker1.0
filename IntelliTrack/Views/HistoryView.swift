import SwiftUI
import CoreData

struct HistoryView: View {
    // Fetch request to get all workouts, sorted by start date
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Workout.startDate, ascending: false)],
        animation: .default)
    private var workouts: FetchedResults<Workout>

    var body: some View {
        NavigationView {
            List {
                ForEach(workouts) { workout in
                    NavigationLink(destination: WorkoutHistoryDetailView(workout: workout)) {
                        VStack(alignment: .leading) {
                            Text(workout.name ?? "Unnamed Workout")
                                .font(.headline)
                            Text("\(workout.startDate ?? Date(), formatter: itemFormatter)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Workout History")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
