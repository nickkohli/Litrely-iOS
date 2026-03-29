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
                VStack(spacing: 8) {
                    Text("Today's Goal")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(Int(viewModel.schedule.totalGoal)) mL")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("\(Int(viewModel.schedule.completedAmount)) mL completed")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    ProgressView(value: viewModel.schedule.progress)
                        .padding(.top, 8)
                        .padding(.horizontal)
                }
                .padding()
                
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
                        
                        if item.isCompleted {
                            Text("Completed")
                                .fontWeight(.semibold)
                                .foregroundStyle(.green)
                        } else {
                            Button("Complete") {
                                viewModel.completeBottle(item)
                            }
                            .buttonStyle(.borderedProminent)
                        }
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
