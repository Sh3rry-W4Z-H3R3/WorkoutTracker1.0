import SwiftUI

struct SettingsView: View {
    // Access the color scheme manager from the environment
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $colorSchemeManager.colorSchemeOption) {
                        ForEach(ColorSchemeOption.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Resources")) {
                    NavigationLink(destination: GlossaryView()) {
                        Label("Technique Glossary", systemImage: "book.closed.fill")
                    }
                }
                // More settings can be added here in the future
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
