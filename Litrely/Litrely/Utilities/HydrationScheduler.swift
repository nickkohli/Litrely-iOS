//
//  HydrationScheduler.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//


import Foundation

struct HydrationScheduler {
    func makeSchedule(from settings: HydrationSettings) -> DailySchedule {
        let totalBottles = Int(ceil(settings.dailyGoal / settings.bottleSize))
        
        guard totalBottles > 0 else {
            return DailySchedule(items: [], totalGoal: settings.dailyGoal)
        }
        
        let wakeTime = settings.wakeTime
        let sleepTime = settings.sleepTime
        let dayDuration = sleepTime.timeIntervalSince(wakeTime)
        
        guard dayDuration > 0 else {
            return DailySchedule(items: [], totalGoal: settings.dailyGoal)
        }
        
        let interval = dayDuration / Double(totalBottles)
        var items: [BottleScheduleItem] = []
        
        for bottleNumber in 1...totalBottles {
            let finishBy = wakeTime.addingTimeInterval(interval * Double(bottleNumber))
            
            let remainingGoal = settings.dailyGoal - (Double(bottleNumber - 1) * settings.bottleSize)
            let amount = min(settings.bottleSize, remainingGoal)
            
            let item = BottleScheduleItem(
                bottleNumber: bottleNumber,
                amount: amount,
                finishBy: finishBy
            )
            
            items.append(item)
        }
        
        return DailySchedule(items: items, totalGoal: settings.dailyGoal)
    }
}
