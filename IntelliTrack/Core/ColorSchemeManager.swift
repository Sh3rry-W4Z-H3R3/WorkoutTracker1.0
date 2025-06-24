import SwiftUI

// Enum to represent the available color schemes
enum ColorSchemeOption: String, CaseIterable {
    case system = "System Default"
    case light = "Light"
    case dark = "Dark"
    case highContrast = "High Contrast"
}

class ColorSchemeManager: ObservableObject {
    // Publish the selected color scheme option
    @AppStorage("colorScheme") var colorSchemeOption: ColorSchemeOption = .system

    var preferredColorScheme: ColorScheme? {
        switch colorSchemeOption {
        case .system:
            return nil // Use the system's setting
        case .light:
            return .light
        case .dark, .highContrast: // High contrast will be based on dark mode
            return .dark
        }
    }
}
