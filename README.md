<div align="center">

# Planto 🌱

**Your plants, all in one place.**

Planto helps you keep track of every plant you own and gently reminds you when they're waiting for a sip, so none of them get forgotten.

<br>

![iOS](https://img.shields.io/badge/iOS-26%2B-1C1C1E?style=flat-square&logo=apple&logoColor=white)
![Swift](https://img.shields.io/badge/Swift-0A6C8A?style=flat-square&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-2E7D63?style=flat-square&logo=swift&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-3A3A3C?style=flat-square)

</div>

<br>

## ✦ What you can do

| | |
|:--|:--|
| **Add a plant** | Give it a name, pick its room, light, watering days, and water amount |
| **Water with a tap** | Tick a plant off and watch the daily progress bar fill up |
| **Edit anytime** | Tap any plant to update its details |
| **Remove a plant** | Swipe to delete, or delete it from the edit sheet |
| **Get reminders** | A nudge while any plant is still thirsty, which stops once they're all watered |
| **Finish the day** | See an *All Done* screen when every plant is taken care of |

<br>

## ✦ Built with

- <img src="https://img.shields.io/badge/SwiftUI-2E7D63?style=flat-square&logo=swift&logoColor=white" alt="SwiftUI" align="center"> &nbsp;The whole app is built with native SwiftUI components
- **MVVM** as the design pattern

<br>

## ✦ Project structure

```
Planto
├── Models
│   └── Plant.swift               # Plant data + room, light, and watering options
├── ViewModels
│   └── PlantsViewModel.swift     # Add, edit, delete, water, progress
├── Services
│   └── NotificationManager.swift # Schedules and cancels reminders
└── Views
    ├── MyplantsView.swift        # Main screen and its states
    └── SetReminderSheet.swift    # Add / edit sheet
```

<br>

## ✦ Getting started

1. Clone the repo
2. Open `Planto.xcodeproj` in **Xcode 26** or later
3. Pick an iPhone simulator and press **⌘R**

<br>

<div align="center">

<sub>Made by <a href="https://github.com/TarafALD">Taraf Aldriweesh</a> · Apple Developer Academy</sub>

</div>
