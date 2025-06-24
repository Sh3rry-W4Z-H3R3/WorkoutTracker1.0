import Foundation

struct FitnessCalculators {
    
    /**
     Estimates the 1-Rep Max (1RM) using the Epley formula.
     
     - Parameters:
        - weight: The weight lifted.
        - reps: The number of repetitions performed.
     - Returns: The estimated 1-Rep Max.
     */
    static func estimatedOneRepMax(weight: Double, reps: Int16) -> Double {
        // The Epley formula: 1RM = w * (1 + r / 30)
        // It's generally considered valid for reps between 1 and 10.
        if reps < 1 {
            return 0
        }
        if reps == 1 {
            return weight
        }
        return weight * (1.0 + (Double(reps) / 30.0))
    }
}
