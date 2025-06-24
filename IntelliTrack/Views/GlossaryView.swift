import SwiftUI

struct GlossaryView: View {
    var body: some View {
        NavigationView {
            List(SetType.allCases, id: \.self) { setType in
                NavigationLink(destination: GlossaryDetailView(setType: setType)) {
                    Text(setType.rawValue)
                }
            }
            .navigationTitle("Technique Glossary")
        }
    }
}

struct GlossaryDetailView: View {
    let setType: SetType
    
    private var description: String {
        switch setType {
        case .straight:
            return "Traditional multiple sets at a fixed weight and number of reps."
        case .drop:
            return "Perform a set to failure, then immediately reduce (drop) the weight and continue for more reps."
        case .superset:
            return "Alternate between two different exercises with no rest in between."
        case .pyramid:
            return "Increase or decrease the weight with each successive set. A common approach is to increase weight while decreasing reps."
        case .myo:
            return "Perform one 'activation' set of high reps, followed by several short 'mini-sets' with very brief rest periods."
        case .restPause:
            return "Take short rests (15-30 seconds) between reps or clusters of reps within a single set to extend the set's duration."
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(setType.rawValue)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(description)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle(setType.rawValue)
    }
}

struct GlossaryView_Previews: PreviewProvider {
    static var previews: some View {
        GlossaryView()
    }
}
