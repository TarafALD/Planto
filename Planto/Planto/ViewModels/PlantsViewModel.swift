//
//  PlantsViewModel.swift
//  Planto
//
//  Created by Taraf Aldriweesh on 10/11/2026.
//
import SwiftUI

@Observable //makes a class notify the screens when its data changes

class PlantsViewModel {
    var plants: [Plant] = []
    
    func add(_ plant: Plant) {
        var plant = plant
        plant.name = plant.name.trimmingCharacters(in: .whitespaces)
        guard !plant.name.isEmpty else { return }
        plants.append(plant)
    }
    
    func delete(_ plant:Plant){
        plants.removeAll {$0.id == plant.id}
    }
    
    func toggleWatered(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index].isWatered.toggle()
        }
    }
    func update(_ plant: Plant) {
        var plant = plant
        plant.name = plant.name.trimmingCharacters(in: .whitespaces)
        guard !plant.name.isEmpty else { return }

        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index] = plant
        }
    }
    
    var allWatered: Bool {
        plants.allSatisfy { $0.isWatered }
    }

}
