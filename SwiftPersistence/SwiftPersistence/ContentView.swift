//
//  ContentView.swift
//  SwiftPersistence
//
//  Created by Mac on 01/10/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingItemmSheet = false
    @Query(sort: \Expense.date) var expenses: [Expense] = []
    @State var editedExpense: Expense?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            editedExpense = expense
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                })
            }
            .navigationTitle("Expense")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemmSheet, content: {
                AddExpenseSheet(isEditing: false)
            })
            .sheet(item: $editedExpense, content: { expense in
                AddExpenseSheet(expense: expense, isEditing: true)
            })
            .toolbar(content: {
                if !expenses.isEmpty {
                    Button {
                        isShowingItemmSheet = true
                    } label: {
                        Label("Add expense", systemImage: "plus")
                    }
                }
            })
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView {
                        Label("No expenses", systemImage: "list.bullet.rectangle.portrait")
                    } description: {
                        Text("Start adding expense to see your list.")
                    } actions: {
                        Button {
                            isShowingItemmSheet = true
                        } label: {
                            Text("Add expense")
                        }
                    }
                    .offset(y: -60)
                }
            }
        }
    }
}

struct ExpenseCell: View {
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.date, style: .date)
                .frame(width: 150, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "USD"))
        }
    }
}

struct AddExpenseSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State var expense: Expense = .init(name: "", date: .now, value: 0.0)
    var isEditing: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        context.insert(expense)
                        do {
                            try context.save()
                            dismiss()
                        } catch {
                            print("mine fail saving")
                        }
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
