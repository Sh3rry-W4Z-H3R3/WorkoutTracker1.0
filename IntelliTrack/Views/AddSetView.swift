import SwiftUI

struct AddSetView: View {
    // State for the user's input
    @State private var reps: String = ""
    @State private var weight: String = ""
    @State private var setType: SetType = .straight
    
    // This closure is called when the user saves the set
    var onSave: (Int, Double, SetType) -> Void
    
    // Environment variable to dismiss the view
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Set Details")) {
                    TextField("Reps", text: $reps)
                        .keyboardType(.numberPad)
                    TextField("Weight (kg)", text: $weight)
                        .keyboardType(.decimalPad)
                    Picker("Set Type", selection: $setType) {
                        ForEach(SetType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
                
                Section {
                    Button("Save Set") {
                        // Convert strings to numbers before saving
                        let repCount = Int(reps) ?? 0
                        let weightValue = Double(weight) ?? 0.0
                        onSave(repCount, weightValue, setType)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Add New Set")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddSetView_Previews: PreviewProvider {
    static var previews: some View {
        AddSetView(onSave: { _, _, _ in })
    }
}
