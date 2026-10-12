//
//  Untitled.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//
import Foundation

struct Expense: Identifiable, Equatable {
    let id: String
    let title: String
    let amount: Decimal
    let date: Date
}
