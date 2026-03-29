//
//  ScheduleViewModel.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//


import Foundation
import Combine

final class ScheduleViewModel: ObservableObject {
    @Published private(set) var schedule: DailySchedule
    
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
    
    func completeBottle(_ item: BottleScheduleItem) {
        guard let index = schedule.items.firstIndex(where: { $0.id == item.id }) else {
            return
        }
        
        guard !schedule.items[index].isCompleted else {
            return
        }
        
        schedule.items[index].isCompleted = true
    }
}

private extension BottleScheduleItem {
    func targetAmountDelta(from items: [BottleScheduleItem]) -> Double {
        guard bottleNumber > 1 else { return targetAmount }
        let previous = items.first(where: { $0.bottleNumber == bottleNumber - 1 })?.targetAmount ?? 0
        return targetAmount - previous
    }
}
