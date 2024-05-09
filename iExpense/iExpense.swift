//
//  iExpense.swift
//  iExpense
//
//  Created by Raghavendra Mirajkar on 09/05/24.
//
import Observation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct iExpense: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading, content: {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            })
                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                    }
                    .onDelete(perform: { indexSet in
                        removeItems(at: indexSet)
                    })
                }
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 20)
//                    expenses.items.append(expense)
                    showingAddExpense.toggle()
                }
                EditButton()
            }
        }
    }
    
    func removeItems(at offsets : IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    iExpense()
}
