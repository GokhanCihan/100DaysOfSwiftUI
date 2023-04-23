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
        //Environment modifier {.font()}: child view modifier takes priority
        VStack {
            Text("Gryffindor")
                .font(.title)
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.largeTitle)
        .blur(radius: 5)
    }
}

struct PropertiesView: View {
    let textView = Text("Text View as a property")
    let buttonView = Button("property button") {}
    var body: some View {
        VStack {
            textView
                .background(.green)
            buttonView
                .buttonStyle(.borderedProminent)
        }
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct CompositeView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CompositeView()
    }
}
