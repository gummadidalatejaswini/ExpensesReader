//
//  ExpensesRowView.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import SwiftUI

struct ExpensesRowView: View {
    let expense: Expense

        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(expense.title)
                        .font(.headline)

                    Text(
                        expense.date,
                        format: .dateTime
                            .day()
                            .month(.abbreviated)
                            .year()
                    )
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                }

                Spacer()

                Text(
                    expense.amount,
                    format: .currency(code: "USD")
                )
                .font(.headline)
                
            }
            .padding(.vertical, 6)
            .accessibilityElement(children: .combine)
        }
    }
