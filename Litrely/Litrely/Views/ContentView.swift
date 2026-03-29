//
//  ContentView.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    private let scheduler = HydrationScheduler()
    
    private var sampleSchedule: DailySchedule {
        let calendar = Calendar.current
        
        let wakeTime = calendar.date(
            bySettingHour: 8,
            minute: 0,
            second: 0,
            of: Date()
        ) ?? Date()
        
        let sleepTime = calendar.date(
            bySettingHour: 22,
            minute: 0,
            second: 0,
            of: Date()
        ) ?? Date()
        
        let settings = HydrationSettings(
            wakeTime: wakeTime,
            sleepTime: sleepTime,
            dailyGoal: 2000,
            bottleSize: 500
        )
        
        return scheduler.makeSchedule(from: settings)
    }
    
    var body: some View {
        NavigationStack {
            List(sampleSchedule.items) { item in
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
