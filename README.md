# Litrely

**Hydration pacing iOS app that converts a daily water goal into a structured, time-based refill schedule.**

## Project Status
**In Active Development**

Litrely is a flagship portfolio project being built with a strong emphasis on clean architecture, testability, and professional development practices. The repository is public from day one and documents the full lifecycle of building a production quality iOS application.

---

## Concept Overview
Litrely helps users stay consistently hydrated throughout the day by transforming a daily water intake goal into a **bottle-based schedule** with clear “finish by” times.

Instead of tracking water reactively, the app introduces a **proactive pacing system**:
- Users define their wake/sleep window and bottle size  
- The app generates a structured drinking schedule  
- Timed reminders guide users to stay on track  
- Progress is visualised across the day  

The core idea is simple:  
**Hydration becomes predictable, structured, and easy to follow.**

---

## Core Features (Planned & In Progress)

- **Guided Onboarding**
  - Wake/sleep window configuration  
  - Bottle size selection  
  - Daily goal slider with visual feedback  

- **Hydration Scheduling Engine**
  - Pure Swift algorithm (fully unit tested)  
  - Generates evenly distributed bottle targets  
  - Calculates “finish by” times for each bottle  

- **Progress Tracking**
  - Sequential bottle completion system  
  - Real-time updates across the day  
  - Clear visual feedback for remaining intake  

- **Local Notifications**
  - Time-based reminders aligned with schedule  
  - Encourages consistent pacing rather than catch-up drinking  

- **Settings & Customisation**
  - Editable hydration goals and daily schedule inputs  
  - Persistent user preferences  

- **Cloud Sync (Firebase)**
  - Authentication (Firebase Auth)  
  - User data storage (Firestore)  
  - Cross-device synchronisation  

---

## Engineering Focus

This project is intentionally structured to reflect **industry-level iOS development practices**:

- **Architecture:** MVVM with clear separation of concerns  
- **State Management:** ObservableObject + SwiftUI data flow  
- **Scheduling Engine:** Pure logic layer, isolated and unit tested  
- **Persistence:** Firestore with scalable document structure  
- **Notifications:** Local notification scheduling tied to computed data  
- **Version Control:** Feature branches, clean commit history, milestone tagging  
- **Documentation:** Ongoing development diary and structured repository  

---

## Repository Structure
```
/
├── README.md
├── documents/
│   └── diary.md                  # Development log and architectural decisions
└── Litrely/
    ├── App/
    ├── Features/
    │   ├── Onboarding/
    │   ├── Schedule/
    │   ├── Progress/
    │   └── Settings/
    ├── Core/
    │   ├── Models/
    │   ├── ViewModels/
    │   ├── Services/
    │   └── Utilities/
    ├── Resources/
    └── SupportingFiles/
```
*(Structure will evolve as features are implemented.)*

---

## Current Progress

- Project initialised with SwiftUI app lifecycle  
- MVVM structure established  
- Core scheduling logic implemented  
- Schedule ViewModel created and integrated  
- Sequential bottle completion logic implemented  
- Git workflow established with structured commits  

---

## Upcoming Milestones

- Settings navigation integration  
- Local notification system  
- Onboarding flow completion  
- Firestore integration  
- UI refinement and visual design pass  
- Test coverage expansion (scheduling engine)  

---

## How to Run

1. Clone the repository:
   git clone https://github.com/your-username/Litrely-iOS.git

2. Open the project in Xcode  
3. Select a simulator or device  
4. Build and run  

---

## Development Philosophy

Litrely is being built as a **portfolio-quality project**, with focus on:

- Writing clean, maintainable Swift code  
- Building features incrementally with clear milestones  
- Treating the repository as a professional engineering artifact  
- Prioritising correctness (logic) before polish (UI)  

---

## Contact

**Developer:** Nick Kohli
For questions or collaboration, feel free to connect via GitHub or LinkedIn.
