//
//  ExpensesUseCase.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//
protocol ExpenseUseCaseProtocol {
    func execute() async throws -> [Expense]
}
class ExpensesUseCase: ExpenseUseCaseProtocol {
    private let repository:  ExpenseRepositoryProtocol

    init(repository: ExpenseRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Expense] {
        let expenses = try await repository.fetchExpenses()

        return expenses.sorted {
            $0.date > $1.date
        }
    }
}
