//
//  ExpnesesMapper.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import Foundation

struct ExpenseMapper {
    func map(_ record: ExpensesRecord) -> Expense {
        Expense(
            id: record.expenseID,
            title: record.title,
            amount: record.amount.decimalValue,
            date: record.date
        )
    }
}
