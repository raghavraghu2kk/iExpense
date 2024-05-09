//
//  sample4.swift
//  iExpense
//
//  Created by Raghavendra Mirajkar on 09/05/24.
//

import SwiftUI

struct sample4: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("tapppingCount") private var tappingCount = 0
    
    var body: some View {
        
        VStack {
            
            Button("Tap Count \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
            
            Button("Tapping Count \(tappingCount)") {
                tappingCount += 1
            }

        }
    }
    
}

#Preview {
    sample4()
}
