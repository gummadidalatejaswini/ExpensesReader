//
//  ExpensesReaderApp.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

import SwiftUI

@main
struct ExpensesReaderApp: App {
    private let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            ExpensesView(viewModel: container.expenseViewModel)
        }
    }
}
