import SwiftUI

@main
struct IntelliTrackApp: App {
    // Create an instance of our Core Data persistence controller
    let persistenceController = PersistenceController.shared
    // Create and manage the color scheme manager
    @StateObject private var colorSchemeManager = ColorSchemeManager()

    var body: some Scene {
        WindowGroup {
            TabView {
                WorkoutView(context: persistenceController.container.viewContext)
                    .tabItem {
                        Label("Workout", systemImage: "flame.fill")
                    }
                
                HistoryView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("History", systemImage: "clock.fill")
                    }
                
                ProgressView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Progress", systemImage: "chart.bar.xaxis")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .environmentObject(colorSchemeManager)
            .preferredColorScheme(colorSchemeManager.preferredColorScheme)
            .environment(\.colorSchemeContrast, colorSchemeManager.colorSchemeOption == .highContrast ? .increased : .standard)
        }
    }
}
