//
//  sample5.swift
//  iExpense
//
//  Created by Raghavendra Mirajkar on 09/05/24.
//

import SwiftUI

struct Users : Codable {
    let firstName : String
    let lastName : String
}

struct sample5: View {
    @State private var user1 = Users(firstName: "Taylor", lastName: "Swift")
    var body: some View {
        Button("save user") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user1) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    sample5()
}
