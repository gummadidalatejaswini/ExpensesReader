# ExpensesReader
An iOS app to display expenses using SwiftUI, Swift and Objective-C.
The app fetches expense data from a JSON endpoint,
transforms the response, maps it to domain models, and displays expenses
sorted by date (newest first).
Features
- Fetches expense data from a remote JSON API using URLSession and
  Swift concurrency.
- Transforms JSON dictionaries into Objective-C ExpensesRecord
  objects.
- Maps Objective-C records to Swift Expense domain entities.
- Displays expense title, amount, and date in a SwiftUI list.
- Sorts expenses by date in descending order.
- Handles loading, empty, and error states with a retry action.
- Centralizes user-facing strings using Localizable.strings and
  AppStrings.
- Includes unit tests for use-case sorting, ViewModel states,
  repository behavior, and Objective-C transformation.
Tech Stack
- Swift
- SwiftUI
- Objective-C interoperability via an Objective-C bridging header
- MVVM
- Clean Architecture
- URLSession, async/await
- XCTest
API
The app reads expense data from:
https://www.jsonkeeper.com/b/DYZJF

The response is expected to be an array of objects containing these
fields:
  Field      Purpose
  id       Unique expense identifier
  title    Expense title
  amount   Expense amount
  date     ISO 8601 date string
The API does not specify a currency. The UI currently formats amounts as
USD; change the currency code in ExpenseRowView if the assignment
requires a different currency.
