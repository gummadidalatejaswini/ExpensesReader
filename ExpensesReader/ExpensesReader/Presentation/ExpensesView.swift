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
                ProgressView(AppStrings.Expenses.loading)
            } else if let error = viewModel.errorMessage {
                ErrorView(message: error) {
                    Task {
                        await viewModel.loadExpenses()
                    }
                }
            } else if viewModel.expenses.isEmpty {
                EmptyExpensesView()
            }  else {
                expenseList
            }
        }
        .navigationTitle(AppStrings.Expenses.title)
        .task {
            await viewModel.loadExpenses()
            }
        }
    }
    
    private var expenseList: some View {
           List(viewModel.expenses) { expense in
               ExpensesRowView(expense: expense)
           }
           .listStyle(.insetGrouped)
       }
    
}
