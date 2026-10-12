//
//  ExpensesViewModel.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//
import Combine

@MainActor
final class ExpensesViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let useCase: ExpenseUseCaseProtocol

    init(useCase: ExpenseUseCaseProtocol) {
        self.useCase = useCase
    }

    func loadExpenses() async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            expenses = try await useCase.execute()
        } catch {
            errorMessage = AppStrings.Expenses.errorMessage
        }
    }
}
