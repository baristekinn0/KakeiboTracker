//
//  AddExpenseView.swift
//  KakeiboTracker
//
//  Created by Barış Tekin on 22.05.2025.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var expenses: [Expense]

    @State private var title: String = ""
    @State private var amount: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Harcama Bilgileri")) {
                    TextField("Başlık", text: $title)
                    TextField("Miktar", text: $amount)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Harcama Ekle")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        if let actualAmount = Double(amount) {
                            let newExpense = Expense(title: title, amount: actualAmount)
                            expenses.append(newExpense)
                            dismiss()
                        }
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("İptal") {
                        dismiss()
                    }
                }
            }
        }
    }
}

