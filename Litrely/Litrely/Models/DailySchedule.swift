//
//  DailySchedule.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//


import Foundation

struct DailySchedule {
    let items: [BottleScheduleItem]
    let totalGoal: Double
    
    var completedAmount: Double = 0
    
    var progress: Double {
        guard totalGoal > 0 else { return 0 }
        return completedAmount / totalGoal
    }
}
