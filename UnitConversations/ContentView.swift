//
//  ContentView.swift
//  UnitConversations
//
//  Created by Seymen Özdeş on 5.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Unit Name", text: $name)
                } header: {
                    Text("Enter the value you want to convert?")
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
