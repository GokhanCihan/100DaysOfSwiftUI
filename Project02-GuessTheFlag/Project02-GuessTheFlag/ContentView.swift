//
//  ContentView.swift
//  Project02-GuessTheFlag
//
//  Created by Gökhan on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = "score"
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)

    let myBluishColor = Color(.init(red: 0.3, green: 0.4, blue: 1, alpha: 0.9))

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: .black, location: 0),
                    Gradient.Stop(color: .blue, location: 0.2),
                    Gradient.Stop(color: myBluishColor, location: 0.6),
                    Gradient.Stop(color: .blue, location: 0.8),
                    Gradient.Stop(color: .black, location: 1)
                ]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()

            VStack {
                VStack(spacing: 10) {
                    Text("Guess the Flag")
                            .font(.largeTitle.weight(.bold))
                            .foregroundColor(.white)
                    
                    Text("Score: ???")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Spacer()
                    
                    VStack() {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .fontWidth(.expanded)
                    }
                    
                    VStack(spacing: 25) {
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 10)
                            }
                        }
                    }
                    .frame(maxWidth: 300)
                    .padding(.vertical, 20)
                    .background(.ultraThinMaterial.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    Spacer()
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: newQuestion)
        } message: {
            Text("Your score is ????????")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    
    func newQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ExamplesView: View {
    @State private var showingAlert = false
    
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
            
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Long information text etc.")
            }
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
