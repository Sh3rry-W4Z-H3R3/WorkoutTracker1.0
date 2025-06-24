---
trigger: model_decision
description: Apply this rule when thinking about the overall app and align design choices with guidelines
---


AI-Powered Fitness Tracker (iOS App) with Intelligent Workout Tracking
🧠 Project Overview
This project will deliver a native iOS application built in Swift that provides an intelligent fitness tracking experience. Inspired by Hevy, the app offers deeper insights and superior logging capabilities for users to track their progress effectively.

Key innovations include intelligent rep-type tracking (e.g., drop sets, super sets, pyramid sets), comprehensive progress visualization, and enhanced accessibility features. Designed for everyone from novices to advanced lifters, including users managing diabetes, the app aims to be a powerful and dynamic workout log and analysis tool in your pocket.

📱 Platform & Delivery Scope
Platform: Native iOS (iPhone, iPad)
Language: Swift (UIKit or SwiftUI)
OS Compatibility: iOS 15+
Distribution: Apple App Store
Future Consideration: Apple Watch & macOS versions
Android version may be considered post-iOS MVP using shared logic in a cross-platform backend.

🎯 Objectives
Provide advanced, real-time tracking for various rep/set styles.
Improve user adherence with visual, accessible UI and clear progress insights.
Offer medical-friendly tracking and data insights (e.g., related to diabetic fatigue/resistance).
Launch a production-ready app on iOS App Store.
👥 Target Users
Lifters: novice to elite
Individuals managing diabetes or chronic conditions
Trainers, doctors, and health-focused professionals
Users with low fitness literacy
🏋️‍♀️ Key Differentiators from Hevy
Feature	Hevy	This App (iOS)	Notes
Manual workout logging	✅	✅	Core functionality, enhanced
Supersets / drop sets / pyramid	⚠️ Limited	✅ Full support	Major differentiator: precise tracking
Personalized AI-generated plans	❌	❌	Removed from scope for MVP
Visual accessibility layer	❌	✅	Literacy-inclusive UX for logging & insights
Real-time adaptive training	❌	❌	Removed from scope for MVP
Diabetes-specific consideration	❌	✅ Enhanced Tracking	Optional inputs for relevant insights from logged data
Apple Watch support	❌	🚧 Future version	WatchOS integration roadmap
Social/sharing features	✅	⚠️ Optional	May come post-MVP

Export to Sheets
💡 Core Features
Milestone 1: Advanced Rep/Set Tracking Engine
Native iOS rep/set tracker with comprehensive support for:
Drop sets
Super sets
Myo reps
Pyramid sets
Rest-pause
Straight sets
Real-time volume/load feedback during logging.
Tap-based rep input with visual timers for rest.
Ability to create and save custom workout routines/templates.
Comprehensive exercise library with user-addable custom exercises.
Milestone 2: Progress Tracking & Analytics
Detailed history of all logged workouts.
Visual progress indicators (charts/graphs) for:
Total volume (per muscle group, exercise, or overall)
1 Rep Max (1RM) estimation per exercise
Consistent personal records (PRs) tracking
Workout duration and consistency
Body measurement tracking (weight, circumference measurements, photos).
Milestone 3: Accessibility & Visual Layer
Muscle group visualization per exercise for better understanding.
Visual glossary of advanced rep types with explanations.
Simple and intuitive UX tailored to low-literacy users, emphasizing clear icons and minimal text where possible.
Customizable display options for visual impairments (e.g., larger fonts, high contrast modes).
🔁 Supported Rep/Set Types (for Tracking)
Name	Description
Drop Sets	Decrease weight after failure and continue the set
Super Sets	Alternate between two exercises without rest
Myo Reps	Perform one activation set followed by multiple short rest/pause clusters
Pyramid Sets	Increase or decrease weight with each successive set
Rest-Pause	Small rests between reps to extend set duration
Straight Sets	Traditional multiple sets at fixed weight and reps

Export to Sheets
📊 Data Insights Summary (Post-Logging)
Inputs (Logged Data):
User data: Age, weight, height, training experience
Health info: Optional diabetes flag, self-reported fatigue levels, adherence to routines
Detailed logged workouts (sets, reps, weight, exercise type, rest times, RPE)
Body measurements over time
Processing (In-app or Backend):
Calculates total volume, estimated 1RM, and other performance metrics.
Identifies trends and patterns in logged data (e.g., strength progression, plateaus, consistency).
For users with specific health flags (e.g., diabetes), it can highlight correlations between logged workouts, fatigue, and other self-reported metrics.
Outputs:
Comprehensive visual progress reports.
Insights into training intensity, volume, and consistency over time.
Alerts for potential overtraining or lack of progression based on historical logged data.
🔧 Tech Stack
Component	Technology
Mobile Frontend	Swift (UIKit / SwiftUI)
State Management	Combine / SwiftData
Backend	Python (FastAPI or Django)
Database (local)	CoreData or Realm
Database (cloud, optional)	Firebase/Supabase (for sync)
Graph Plotting	Swift Charts / Core Graphics
Visuals	SVG rendering + custom views
Deployment	Xcode + TestFlight + App Store



✅ Success Criteria
[ ] 90%+ logging adherence in closed beta.
[ ] Accurate set/rep volume tracking with advanced types.
[ ] >80% satisfaction score from diabetic and novice users regarding tracking clarity and insights.
[ ] Successful App Store deployment with Apple review approval.
[ ] Users can clearly visualize their progression (or plateaus) over 6-week cycles based on their logged data.
📈 Future Roadmap
⌚ Apple Watch version for wrist-based rep logging.
🌐 Web dashboard for trainers & clinics to view client progress.
📡 Sync with Apple HealthKit or CGM (Continuous Glucose Monitor) for