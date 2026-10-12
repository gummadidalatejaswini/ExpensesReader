//
//  EmptyExpensesView.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//


import SwiftUI

struct EmptyExpensesView: View {
    var body: some View {
        ContentUnavailableView(
            AppStrings.Expenses.emptyTitle,
            systemImage: "receipt",
            description: Text(AppStrings.Expenses.emptyDescription)
        )
    }
}
