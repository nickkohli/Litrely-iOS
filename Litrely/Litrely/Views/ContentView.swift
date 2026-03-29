//
//  ContentView.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                // Header
                VStack(spacing: 8) {
                    Text("Today's Goal")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(Int(viewModel.schedule.totalGoal)) mL")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("\(viewModel.schedule.items.count) bottles")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding()
                
                // Schedule List
                List(viewModel.schedule.items) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Bottle \(item.bottleNumber)")
                                .font(.headline)
                            
                            Text("Finish by \(item.finishBy.formatted(date: .omitted, time: .shortened))")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text("\(Int(item.targetAmount)) mL")
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Litrely")
        }
    }
}

#Preview {
    ContentView()
}
