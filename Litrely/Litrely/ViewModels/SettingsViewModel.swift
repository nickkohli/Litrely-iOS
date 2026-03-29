//
//  SettingsViewModel.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//


import Foundation
import Combine

final class SettingsViewModel: ObservableObject {
    @Published var wakeTime: Date
    @Published var sleepTime: Date
    @Published var dailyGoal: Double
    @Published var bottleSize: Double
    
    init() {
        let calendar = Calendar.current
        
        self.wakeTime = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: Date()) ?? Date()
        self.sleepTime = calendar.date(bySettingHour: 22, minute: 0, second: 0, of: Date()) ?? Date()
        self.dailyGoal = 2000
        self.bottleSize = 500
    }
    
    var hydrationSettings: HydrationSettings {
        HydrationSettings(
            wakeTime: wakeTime,
            sleepTime: sleepTime,
            dailyGoal: dailyGoal,
            bottleSize: bottleSize
        )
    }
}
