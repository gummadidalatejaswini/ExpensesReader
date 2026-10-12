//
//  ExpensesView.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject private var viewModel: ExpensesViewModel
    
    init(viewModel: ExpensesViewModel) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }

    var body: some View  {
        NavigationStack {
        Group {
            if viewModel.isLoading && viewModel.expenses.isEmpty {
                ProgressView("Loading expenses...")
            } else {
                List(viewModel.expenses) { expense in
                    ExpensesRowView(expense: expense)
                }
                .listStyle(.insetGrouped)
            }
        }
        .navigationTitle("Expenses")
        .task {
            await viewModel.loadExpenses()
            }
        }
    }
}
