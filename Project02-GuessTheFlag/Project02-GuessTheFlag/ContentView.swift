//
//  ContentView.swift
//  Project02-GuessTheFlag
//
//  Created by Gökhan on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
