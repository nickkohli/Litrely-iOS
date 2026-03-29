//
//  ScheduleViewModel.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//


import Foundation
import Combine

final class ScheduleViewModel: ObservableObject {
    @Published var schedule: DailySchedule
    
    private let scheduler = HydrationScheduler()
    
    init() {
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
        
        self.schedule = scheduler.makeSchedule(from: settings)
    }
}
