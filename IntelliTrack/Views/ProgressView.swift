import SwiftUI
import CoreData

struct ProgressView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Workout.startDate, ascending: true)],
        animation: .default)
    private var workouts: FetchedResults<Workout>
    
    // State for the selected exercise for the 1RM chart
    @State private var selectedExerciseName: String = ""
    
    private var allExerciseNames: [String] {
        let allSets = workouts.flatMap { $0.sets as? Set<WorkoutSet> ?? [] }
        let allNames = allSets.compactMap { $0.exercise?.name }
        return Array(Set(allNames)).sorted()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Section for Workout Volume
                    Section(header: Text("Workout Volume Over Time").font(.title2).fontWeight(.bold).padding(.horizontal)) {
                        if !workouts.isEmpty {
                            WorkoutVolumeChartView(workouts: Array(workouts))
                                .frame(height: 250)
                                .padding(.horizontal)
                        } else {
                            Text("No workout data available.")
                                .padding()
                        }
                    }
                    
                    // Section for 1RM Progress
                    Section(header: Text("1-Rep Max Progress").font(.title2).fontWeight(.bold).padding([.horizontal, .top])) {
                        if !allExerciseNames.isEmpty {
                            Picker("Select Exercise", selection: $selectedExerciseName) {
                                ForEach(allExerciseNames, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.horizontal)
                            
                            OneRepMaxChartView(workouts: Array(workouts), exerciseName: selectedExerciseName)
                                .frame(height: 250)
                                .padding(.horizontal)
                        } else {
                            Text("Log a workout to see 1RM progress.")
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("Progress")
            .onAppear {
                // Select the first exercise by default
                if selectedExerciseName.isEmpty {
                    selectedExerciseName = allExerciseNames.first ?? ""
                }
            }
        }
    }
}

struct WorkoutVolumeChartView: View {
    let workouts: [Workout]

    private var chartData: [(date: Date, volume: Double)] {
        workouts.map { workout in
            let volume = (workout.sets as? Set<WorkoutSet> ?? []).reduce(0) { total, set in
                total + (set.weight * Double(set.reps))
            }
            return (date: workout.startDate ?? Date(), volume: volume)
        }
    }

    private var maxVolume: Double {
        chartData.map { $0.volume }.max() ?? 1
    }

    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            ForEach(chartData, id: \.date) { data in
                VStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: (data.volume / maxVolume) * 200)
                    Text(data.date, style: .date)
                        .font(.caption)
                        .frame(height: 40)
                }
            }
        }
    }
}

struct OneRepMaxChartView: View {
    let workouts: [Workout]
    let exerciseName: String

    private var chartData: [(date: Date, e1RM: Double)] {
        workouts.compactMap { workout in
            let setsForExercise = (workout.sets as? Set<WorkoutSet> ?? []).filter { $0.exercise?.name == exerciseName }
            let maxE1RM = setsForExercise.map { FitnessCalculators.estimatedOneRepMax(weight: $0.weight, reps: $0.reps) }.max()
            
            if let maxE1RM = maxE1RM {
                return (date: workout.startDate ?? Date(), e1RM: maxE1RM)
            } else {
                return nil
            }
        }
    }

    private var maxE1RM: Double {
        chartData.map { $0.e1RM }.max() ?? 1
    }

    var body: some View {
        GeometryReader { geometry in
            let points = chartData.enumerated().map {
                CGPoint(x: CGFloat($0.offset) * (geometry.size.width / CGFloat(chartData.count - 1)),
                        y: geometry.size.height - (CGFloat($0.element.e1RM / maxE1RM) * geometry.size.height))
            }
            
            Path { path in
                guard !points.isEmpty else { return }
                path.move(to: points.first!)
                for point in points.dropFirst() {
                    path.addLine(to: point)
                }
            }
            .stroke(Color.green, lineWidth: 2)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
