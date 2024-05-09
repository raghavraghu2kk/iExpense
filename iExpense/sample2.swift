//
//  sample2.swift
//  iExpense
//
//  Created by Raghavendra Mirajkar on 09/05/24.
//

import SwiftUI

struct SecondView : View {
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismmis") {
            dismiss()
        }
    }
}

struct sample2: View {
    @State var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name: "Raghavendra Mirajkar")
        })
    }
}

#Preview {
    sample2()
}
