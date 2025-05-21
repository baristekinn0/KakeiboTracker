//
//  ContentView.swift
//  KakeiboTracker
//
//  Created by Barış Tekin on 22.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = []
    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Toplam Harcama: \(totalAmount()) ₺")
                    .font(.title2)
                    .padding()

                List(expenses) { expense in
                    VStack(alignment: .leading) {
                        Text(expense.title)
                            .font(.headline)
                        Text("\(expense.amount, specifier: "%.2f") ₺")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                Button(action: {
                    showingAddExpense = true
                }) {
                    Text("Harcama Ekle")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddExpenseView(expenses: $expenses)
                }
            }
            .navigationTitle("Kakeibo")
        }
    }

    func totalAmount() -> Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
}

struct Expense: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
}
