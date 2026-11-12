//
//  MyplantsView.swift
//  Planto
//
//  Created by Taraf Aldriweesh on 09/11/2026.
//

import SwiftUI

struct MyplantsView: View {
    
    @AppStorage("isNewUser") private var isNewUser = false
    @State private var viewModel = PlantsViewModel()
    @State private var showSheet = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle().fill(.divider).frame(height: 1).padding(.leading).padding(.top, 20)
                
                if isNewUser{
                    Image("plant1").padding(.bottom).padding(.top, 64)
                    
                    Text("Start your plant journey!").font(.system(size:25, weight: .semibold))
                    
                    Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                        .font(.system(.callout))
                        .padding(.top )
                        .multilineTextAlignment(.center).padding(.horizontal, 42)
                    
                    Button {
                        
                    } label: {
                        Text("Set Plant Reminder")
                            .padding(.horizontal, 58)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(.button)
                    .padding(.top, 72)
                    
                }/* else if viewModel.plants.isEmpty {
                  Spacer()
                  Text("No reminders set yet..").font(.system(.title2)).foregroundStyle(.noreminders).fontWeight(.semibold)
                  
                  }*/ /*else if viewModel.allWatered {
                       //Spacer()
                       Image("allplantsdone").padding(.bottom).padding(.top, 127)
                       
                       Text("All Done! 🎉").font(.system(size:25, weight: .bold))
                       
                       Text("All Reminders Completed")
                       .font(.system(.callout))
                       .foregroundStyle(.noreminders)
                       .padding(.top, 4)
                       
                       
                       }*/ else {
                           VStack(spacing: 16) {
                               Text(viewModel.wateredCount == 0
                                    ? "Your plants are waiting for a sip 💦"
                                    : "\(viewModel.wateredCount) of your plants feel loved today ✨")

                               ProgressView(value: viewModel.progress)
                                   .tint(.button)
                                   .scaleEffect(y: 2)
                                   .padding(.horizontal, 24)
                           }
                           .padding(.top, 24)
                           .padding(.bottom, 32)

                           List {
                               ForEach(viewModel.plants) { plant in
                                   HStack(spacing: 16) {
                                       Button {
                                           viewModel.toggleWatered(plant)
                                       } label: {
                                           Image(systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                                               .font(.title2)
                                               .foregroundStyle(plant.isWatered ? Color.button : Color.gray)
                                       }
                                       .buttonStyle(.plain)

                                       VStack(alignment: .leading, spacing: 6) {
                                           Label("in \(plant.room.rawValue)", systemImage: "location")
                                               .font(.subheadline)
                                               .foregroundStyle(.secondary)

                                           Text(plant.name)
                                               .font(.title)

                                           HStack(spacing: 8) {
                                               Label(plant.light.rawValue, systemImage: "sun.max")
                                                   .font(.subheadline)
                                                   .foregroundStyle(.suntext)
                                                   .padding(.horizontal, 8)
                                                   .padding(.vertical, 4)
                                                   .background(.quaternary, in: .rect(cornerRadius: 8))

                                               Label(plant.water.rawValue, systemImage: "drop")
                                                   .font(.subheadline)
                                                   .foregroundStyle(.watertext)
                                                   .padding(.horizontal, 4)
                                                   .padding(.vertical, 3)
                                                   .background(.quaternary, in: .rect(cornerRadius: 8))
                                            .overlay {
                                                       RoundedRectangle(cornerRadius: 8)
                                                           .stroke(plant.isWatered ? Color.clear : Color.gray, lineWidth: 1)
                                                   }
                                           }
                                       }
                                       .opacity(plant.isWatered ? 0.68 : 1)

                                   }
                                   .padding(.vertical, 8)
                                   .frame(maxWidth: .infinity, alignment: .leading)

                                   .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                                   .alignmentGuide(.listRowSeparatorTrailing) { d in d.width }
                                   .swipeActions {
                                       Button(role: .destructive) {
                                           viewModel.delete(plant)
                                           
                                       } label: {
                                           Image(systemName: "trash")
                                       }
                                   }
                               }
                           }
                           .listStyle(.plain)
                       }
            }.navigationTitle("My Plants 🌱")
                .overlay(alignment: .bottomTrailing) {
                if !isNewUser {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding(8)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.circle)
                    .tint(.button)
                    .padding()
                }
            }

             
        }
    }
}

#Preview {
    MyplantsView()
        .preferredColorScheme(.dark)
        
            
        
}
