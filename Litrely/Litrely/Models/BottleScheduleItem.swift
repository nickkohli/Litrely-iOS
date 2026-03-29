//
//  BottleScheduleItem.swift
//  Litrely
//
//  Created by Nick Kohli on 29/03/2026.
//


import Foundation

struct BottleScheduleItem: Identifiable {
    let id = UUID()
    let bottleNumber: Int
    let amount: Double
    let finishBy: Date
    var isCompleted: Bool = false
}
