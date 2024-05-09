//
//  sample3.swift
//  iExpense
//
//  Created by Raghavendra Mirajkar on 09/05/24.
//

import SwiftUI

struct sample3: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: { indexSet in
                        removeRows(at: indexSet)
                    })
                }
                
                Button("Add number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }

            }
            .padding()
            .toolbar {
                EditButton()
            }
        }

    }
    
    func removeRows(at offsets : IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    sample3()
}
