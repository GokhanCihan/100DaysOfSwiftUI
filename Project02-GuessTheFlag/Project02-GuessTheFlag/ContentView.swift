//
//  ContentView.swift
//  Project02-GuessTheFlag
//
//  Created by Gökhan on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Buttons
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            // Custom buttons
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
                    .padding(20)
            }
            .background(.bar)
            .buttonStyle(.borderedProminent)
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            .padding(20)
            .buttonStyle(.bordered)
        }
        
        // View with colored background
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("some content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()

        //view with gradient
        ZStack {
            RadialGradient(
                gradient:
                    Gradient(stops: [
                        Gradient.Stop(color: .white, location: 0.0),
                        Gradient.Stop(color: .gray, location: 0.4),
                        Gradient.Stop(color: .black, location: 0.8)
                    ]),
                center: .center,
                startRadius: 0.1,
                endRadius: 400
            )
        }
        
        AngularGradient(
            gradient:
                Gradient(stops: [
                    Gradient.Stop(color: .black, location: 0.480),
                    Gradient.Stop(color: .gray, location: 0.700),
                    Gradient.Stop(color: .white, location: 0.75),
                ]),
            center: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
