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
            List(viewModel.schedule.items) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bottle \(item.bottleNumber)")
                        .font(.headline)
                    
                    Text("Target: \(Int(item.targetAmount)) mL")
                        .font(.subheadline)
                    
                    Text("Finish by: \(item.finishBy.formatted(date: .omitted, time: .shortened))")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Litrely")
        }
    }
}

#Preview {
    ContentView()
}
