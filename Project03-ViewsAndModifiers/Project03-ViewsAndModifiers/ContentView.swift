//
//  ContentView.swift
//  Project03-ViewsAndModifiers
//
//  Created by Gökhan on 23.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
    }
}

struct ExampleView: View {
    var body: some View {
        Button("Hello, world!"){
            print(type(of: self.body))
        }
            .frame(maxWidth: 300, maxHeight: 150)
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
