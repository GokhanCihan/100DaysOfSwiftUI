//
//  ContentView.swift
//  WeSplit
//
//  Created by Gökhan on 16.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentage)
        let tipValue = checkAmount * (tipSelected / 100)
        let total = checkAmount + tipValue
        let totalPerPerson = total / peopleCount
        
        return totalPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of Person", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: -Create Views in a Loop
///     struct ContentView: View {
///        let students = ["Harry", "Hermione", "Ron"]
///        @State private var selectedStudent = "Harry"
///
///        var body: some View {
///            NavigationView {
///                Form {
///                    Picker("Select your student", selection: $selectedStudent) {
///                       ForEach(students, id: \.self) {
///                            Text($0)
///                        }
///                    }
///                }
///            }
///        }
///     }
// MARK: -Modifying Program State
///     struct ContentView: View {
///         @State private var tapCount = 0
///         var body: some View {
///             Button("tap count: \(tapCount)", action: { tapCount += 1 } )
///         }
///     }
// MARK: -Two-way State Binding
///     struct ContentView: View {
///         @State private var name = ""
///         var body: some View {
///             Form {
///                 TextField("your name here", text: $name)
///                 Text("Your name is \(name)")
///             }
///         }
///     }
