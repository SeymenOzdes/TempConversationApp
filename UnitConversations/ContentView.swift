//
//  ContentView.swift
//  UnitConversations
//
//  Created by Seymen Özdeş on 5.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "Fahreneit" // We got the user's temperature unit.
    @State private var outputUnit = "Fahreneit" // We got the temperature unit wanted to convert.
    @State private var Units = ["Fahreneit", "Celsius", "Kelvin"]
    
    var output: Double { // 1.Phase: The entered segments will be converted to Celsius.
        var temperatureInCelsius = 0.0
        
        if inputUnit == "Fahreneit" {
            temperatureInCelsius = (inputValue - 32) / 1.8
        }
        else if inputUnit == "Kelvin" {
            temperatureInCelsius = inputValue - 273.15
        }
        else {
            temperatureInCelsius = inputValue
        }
        // 2.Phase: Conversion from celsius to other units.
        if outputUnit == "Fahreneit" {
            return (temperatureInCelsius * 1.8) + 32
        }
        else if outputUnit == "Kelvin" {
            return  temperatureInCelsius + 273.15
        }
        else {
            return temperatureInCelsius
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Unit Value", value: $inputValue, format: .number)
                    Picker("Units", selection: $inputUnit) {
                        ForEach(Units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Enter the value you want to convert")
                }
                Section {
                    Picker("outputUnits", selection: $outputUnit) {
                        ForEach(Units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select the unit you want to convert")
                }
                Section {
                    Text(output, format: .number)
                } header: {
                    Text("Outcome")
                }
            }
            .navigationTitle("WeConvert")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
