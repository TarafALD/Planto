//
//  SetReminderSheet.swift
//  Planto
//
//  Created by Taraf Aldriweesh on 12/11/2026.
//

import SwiftUI

struct SetReminderSheet: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isNewUser") private var isNewUser = true

    let viewModel: PlantsViewModel
    var plantToEdit: Plant? = nil

    @State private var name = ""
    @State private var room: Room = .bedroom
    @State private var light: Light = .fullSun
    @State private var wateringDays: WateringDays = .everyDay
    @State private var water: Water = .ml20to50

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Plant Name")
                        TextField(" Pothos", text: $name)
                    }
                }

                Section {
                    Picker(selection: $room) {
                        ForEach(Room.allCases, id: \.self) { Text($0.rawValue) }
                    } label: {
                        Label("Room", systemImage: "location")
                    }

                    Picker(selection: $light) {
                        ForEach(Light.allCases, id: \.self) { Text($0.rawValue) }
                    } label: {
                        Label("Light", systemImage: "sun.max")
                    }
                }

                Section {
                    Picker(selection: $wateringDays) {
                        ForEach(WateringDays.allCases, id: \.self) { Text($0.rawValue) }
                    } label: {
                        Label("Watering Days", systemImage: "drop")
                    }

                    Picker(selection: $water) {
                        ForEach(Water.allCases, id: \.self) { Text($0.rawValue) }
                    } label: {
                        Label("Water", systemImage: "drop")
                    }
                }

                if let plantToEdit {
                    Section {
                        Button("Delete Reminder", role: .destructive) {
                            viewModel.delete(plantToEdit)
                            dismiss()
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "checkmark") { save() }
                        .tint(.button)
                        .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .onAppear(perform: loadPlant)
        }
    }

    private func loadPlant() {
        guard let plantToEdit else { return }
        name = plantToEdit.name
        room = plantToEdit.room
        light = plantToEdit.light
        wateringDays = plantToEdit.wateringDays
        water = plantToEdit.water
    }

    private func save() {
        if var plant = plantToEdit {
            plant.name = name
            plant.room = room
            plant.light = light
            plant.wateringDays = wateringDays
            plant.water = water
            viewModel.update(plant)
        } else {
            viewModel.add(Plant(name: name, room: room, light: light, wateringDays: wateringDays, water: water))
            isNewUser = false
        }
        dismiss()
    }
}

#Preview {
    SetReminderSheet(viewModel: PlantsViewModel())
        .preferredColorScheme(.dark)
}
