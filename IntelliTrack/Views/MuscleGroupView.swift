import SwiftUI

struct MuscleGroupView: View {
    let muscleGroup: String

    // Determine which body view and highlight to show
    private var bodyImageName: String {
        switch muscleGroup.lowercased() {
        case "chest", "shoulders", "arms":
            return "body_front"
        case "back", "legs":
            return "body_back"
        default:
            return "body_front" // Default to front view
        }
    }

    private var highlightImageName: String {
        return "\(muscleGroup.lowercased())_highlight"
    }

    var body: some View {
        ZStack {
            Image(bodyImageName)
                .resizable()
                .scaledToFit()

            Image(highlightImageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.red.opacity(0.7)) // The highlight color
        }
        .frame(maxWidth: 200, maxHeight: 400)
    }
}

struct MuscleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            // You will need to add the images to your assets
            // for these previews to work correctly.
            Text("Chest Example")
            MuscleGroupView(muscleGroup: "Chest")
            Text("Back Example")
            MuscleGroupView(muscleGroup: "Back")
        }
    }
}
