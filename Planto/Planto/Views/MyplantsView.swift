//
//  MyplantsView.swift
//  Planto
//
//  Created by Taraf Aldriweesh on 09/11/2026.
//

import SwiftUI

struct MyplantsView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle().fill(.divider).frame(height: 1).padding(.leading).padding(.top, 20)
                
                
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
                Spacer()
                
            }.navigationTitle("My Plants 🌱")
        }
    }
}

#Preview {
    MyplantsView()
        .preferredColorScheme(.dark)
        
            
        
}
