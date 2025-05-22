//
//  ContentView.swift
//  KakeiboTracker
//
//  Created by Barış Tekin on 22.05.2025.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = [
        Expense(title: "Market", amount: 35.50),
        Expense(title: "Kira", amount: 500),
        Expense(title: "Elektrik", amount: 75.20)
    ]
    
    @State private var showExpenses = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                if !showExpenses {
                    Text("Harcamalarım")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 60)
                        .transition(.opacity)
                }
                
                Spacer()
                
                if !showExpenses {
                    Button(action: {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            showExpenses = true
                        }
                    }) {
                        Text("Harcamaları Göster")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(color: Color.blue.opacity(0.4), radius: 8, x: 0, y: 4)
                    }
                    .transition(.scale)
                    .padding(.bottom, 100)
                } else {
                    VStack(spacing: 20) {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                showExpenses = false
                            }
                        }) {
                            Text("Harcamaları Gizle")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220)
                                .background(Color.red)
                                .cornerRadius(15)
                                .shadow(color: Color.red.opacity(0.4), radius: 8, x: 0, y: 4)
                        }
                        .transition(.move(edge: .top))
                        
                        VStack(spacing: 12) {
                            ForEach(expenses) { expense in
                                HStack {
                                    Text(expense.title)
                                        .font(.system(size: 16, weight: .medium))
                                    Spacer()
                                    Text("$\(expense.amount, specifier: "%.2f")")
                                        .foregroundColor(.green)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white.opacity(0.95))
                        )
                        .padding(.horizontal)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    .padding(.top, 80)
                }
                
                Spacer()
            }
        }
    }
}
