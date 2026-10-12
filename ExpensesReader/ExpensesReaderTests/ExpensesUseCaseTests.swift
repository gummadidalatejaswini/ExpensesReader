//
//  ExpensesUseCaseTests.swift
//  ExpensesReaderTests
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import XCTest

final class ExpensesUseCaseTests: XCTestCase {
    
    private struct MockExpenseRepository: ExpenseRepositoryProtocol {
            let expenses: [Expense]

            func fetchExpenses() async throws -> [Expense] {
                expenses
            }
        }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExecuteSortsExpensesNewestFirst() async throws {
            let oldExpense = Expense(
                id: "1",
                title: "Flight to SF",
                amount: Decimal(string: "230.50")!,
                date: Date(timeIntervalSince1970: 100)
            )

            let newExpense = Expense(
                id: "2",
                title: "Hotel",
                amount: Decimal(string: "550.00")!,
                date: Date(timeIntervalSince1970: 200)
            )

            let repository = MockExpenseRepository(
                expenses: [oldExpense, newExpense]
            )

            let useCase = ExpensesUseCase(
                repository: repository
            )

            let result = try await useCase.execute()

        XCTAssertEqual(result.map{$0.id}, ["2", "1"])
        }
}
