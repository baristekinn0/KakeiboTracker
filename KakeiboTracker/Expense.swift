//
//  Expense.swift
//  KakeiboTracker
//
//  Created by Barış Tekin on 22.05.2025.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()       // Her expense benzersiz olacak
    var title: String     // Harcama başlığı
    var amount: Double    // Harcama miktarı
}
