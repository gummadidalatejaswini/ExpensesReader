//
//  ErrorView.swift
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//


import SwiftUI

struct ErrorView: View {
    let message: String
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text(message)
                .multilineTextAlignment(.center)

            Button(AppStrings.Buttons.retry, action: onRetry)
        }
        .padding()
    }
}
