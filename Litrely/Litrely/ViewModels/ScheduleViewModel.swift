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
    private var cancellables = Set<AnyCancellable>()
    
    init(settings: SettingsViewModel) {
        self.schedule = scheduler.makeSchedule(from: settings.hydrationSettings)
        
        settings.$wakeTime
            .combineLatest(
                settings.$sleepTime,
                settings.$dailyGoal,
                settings.$bottleSize
            )
            .sink { [weak self] _, _, _, _ in
                guard let self else { return }
                
                self.schedule = self.scheduler.makeSchedule(from: settings.hydrationSettings)
            }
            .store(in: &cancellables)
    }
    
    func canCompleteBottle(_ item: BottleScheduleItem) -> Bool {
        guard let index = schedule.items.firstIndex(where: { $0.id == item.id }) else {
            return false
        }
        
        guard !schedule.items[index].isCompleted else {
            return false
        }
        
        if index == 0 {
            return true
        }
        
        return schedule.items[index - 1].isCompleted
    }
    
    func completeBottle(_ item: BottleScheduleItem) {
        guard let index = schedule.items.firstIndex(where: { $0.id == item.id }) else {
            return
        }
        
        guard canCompleteBottle(item) else {
            return
        }
        
        schedule.items[index].isCompleted = true
    }
}
