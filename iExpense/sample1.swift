//
//  sample1.swift
//  iExpense
//
//  Created by Raghavendra Mirajkar on 09/05/24.
//
import Observation
import SwiftUI

@Observable
class User {
    var firstName = "Raghavendra"
    var lastName = "Mirajkar"
}

struct sample1: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    sample1()
}
