//
//  ExpensesRepository.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//
import Foundation

protocol ExpenseRepositoryProtocol {
    func fetchExpenses() async throws -> [Expense]
}

struct ExpenseRepository: ExpenseRepositoryProtocol {

    private let url: URL
    private let mapper: ExpenseMapper

    init(
        url: URL = URL(
            string: "https://www.jsonkeeper.com/b/DYZJF"
        )!,
        mapper: ExpenseMapper = ExpenseMapper()
    ) {
        self.url = url
        self.mapper = mapper
    }

    func fetchExpenses() async throws -> [Expense] {
        let records: [ExpensesRecord] = try await APIClient.fetch(
            from: url
        ) { dictionaries in
            let transformer = ExpensesTransformer()
            return transformer.transformJSON(dictionaries)
        }

        return records.map { mapper.map($0) }
    }
}
