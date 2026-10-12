//
//  ExpensesViewModelTests.swift
//  ExpensesReaderTests
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import XCTest
@MainActor
final class ExpensesViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    private func makeExpense() -> Expense {
            Expense(
                id: "1",
                title: "Coffee",
                amount: Decimal(5),
                date: Date(timeIntervalSince1970: 1_760_000_000)
            )
        }

        func testLoadExpensesSuccess() async {
            let expense = makeExpense()
            let useCase = MockGetExpensesUseCase(
                result: .success([expense])
            )
            let viewModel = ExpensesViewModel(useCase: useCase)

            await viewModel.loadExpenses()

            XCTAssertEqual(viewModel.expenses, [expense])
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNil(viewModel.errorMessage)
        }

        func testLoadExpensesFailure() async {
            let useCase = MockGetExpensesUseCase(
                result: .failure(MockError.failed)
            )
            let viewModel = ExpensesViewModel(useCase: useCase)

            await viewModel.loadExpenses()

            XCTAssertTrue(viewModel.expenses.isEmpty)
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNotNil(viewModel.errorMessage)
        }

        func testLoadExpensesStartsWithEmptyState() {
            let useCase = MockGetExpensesUseCase(
                result: .success([])
            )
            let viewModel = ExpensesViewModel(useCase: useCase)

            XCTAssertTrue(viewModel.expenses.isEmpty)
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertNil(viewModel.errorMessage)
        }

}

private struct MockGetExpensesUseCase: ExpenseUseCaseProtocol {
    var result: Result<[Expense], Error>

    func execute() async throws -> [Expense] {
        try result.get()
    }
}

private enum MockError: Error {
    case failed
}
