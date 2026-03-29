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
    let targetAmount: Double
    let finishBy: Date
}
