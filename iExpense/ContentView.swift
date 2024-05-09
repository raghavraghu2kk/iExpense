//
//  ContentView.swift
//  iExpense
//
//  Created by Raghavendra Mirajkar on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            iExpense().tabItem { Label("iExpense", systemImage: "house") }
            sample1().tabItem { Label("Sample 1", systemImage: "house") }
            sample2().tabItem { Label("Sample 2", systemImage: "house") }
            sample3().tabItem { Label("Sample 3", systemImage: "house") }
            sample4().tabItem { Label("Sample 3", systemImage: "house") }
            sample5().tabItem { Label("Sample 4", systemImage: "house") }
        }
        .tint(Gradient(colors: [.red, .purple]))
    }
}

#Preview {
    ContentView()
}
