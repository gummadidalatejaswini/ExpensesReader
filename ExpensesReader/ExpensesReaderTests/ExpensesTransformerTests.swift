//
//  ExpensesTransformerTests.swift
//  ExpensesReaderTests
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import XCTest

final class ExpensesTransformerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTransformsValidExpense() {
        let transformer = ExpensesTransformer()

        let json: [[String: Any]] = [
            [
                "id": "1",
                "title": "Flight to SF",
                "amount": 230.50,
                "date": "2021-07-03T01:50:00+01:00"
            ]
        ]

        let result = transformer.transformJSON(json)

        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0].expenseID, "1")
        XCTAssertEqual(result[0].title, "Flight to SF")
        XCTAssertEqual(
            result[0].amount.doubleValue,
            230.50,
            accuracy: 0.001
        )
    }

    func testSkipsExpenseWithInvalidDate() {
        let transformer = ExpensesTransformer()

        let json: [[String: Any]] = [
            [
                "id": "1",
                "title": "Flight to SF",
                "amount": 230.50,
                "date": "not-a-date"
            ]
        ]

        let result = transformer.transformJSON(json)

        XCTAssertTrue(result.isEmpty)
    }
}
