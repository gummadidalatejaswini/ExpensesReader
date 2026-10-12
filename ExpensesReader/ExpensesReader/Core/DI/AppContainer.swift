//
//  AppContainer.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

struct AppContainer {
    let expenseViewModel: ExpensesViewModel

    init() {
        let repository = ExpenseRepository()
        let useCase = ExpensesUseCase(
            repository: repository
        )

        expenseViewModel = ExpensesViewModel(
            useCase: useCase
        )
    }
}
