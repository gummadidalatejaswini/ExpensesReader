//
//  AppStrings.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//


import Foundation

enum AppStrings {

    enum Expenses {
        static let title =
        "expenses.title".localized

        static let loading =
        "expenses.loading".localized

        static let emptyTitle =
        "expenses.empty.title".localized

        static let emptyDescription =
        "expenses.empty.description".localized

        static let errorMessage =
        "expenses.error.message".localized
    }

    enum Buttons {
        static let retry =
        "common.retry".localized
    }
}

extension String {
  
    var localized: String {
        return NSLocalizedString(self, comment:"")
    }
  
}
