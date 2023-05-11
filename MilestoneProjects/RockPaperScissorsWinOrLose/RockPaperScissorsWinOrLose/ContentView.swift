//
//  ContentView.swift
//  RockPaperScissorsWinOrLose
//
//  Created by Gökhan on 25.04.2023.
//

import SwiftUI

var handGestures = ["✊", "✋", "✌️"]

struct ContentView: View {

    @State private var winCondition = Bool.random()

    @State private var AIGesture: String = handGestures.randomElement()!
    @State private var humanGesture: String = ""

    @State private var AIScore = 0
    @State private var humanScore = 0

    @State private var round = 1

    @State private var roundEnded = false
    @State private var gameEnded = false

    var isHumanGestureCorrect: Bool {
        if humanGesture == "✊" && AIGesture == "✌️" {
            return true
        }else if humanGesture == "✋" && AIGesture == "✊" {
            return true
        }else if humanGesture == "✌️" && AIGesture == "✋" {
            return true
        }else {
            return false
        }
    }

    var isMatchResultCorrect: Bool {
        if winCondition == isHumanGestureCorrect {
            return true
        } else{
            return false
        }
    }

    var gameResult: Bool {
        if humanScore > AIScore {
            return true
        }else {
            return false
        }
    }

    var body: some View {
        ZStack() {
            VStack(alignment: .center, spacing: 0) {

                Text("ROUND \(round)")
                    .font(.system(size: 30))

                Section() {

                    VStack() {
                        Text(AIGesture)
                            .font(.system(size: 200))
                    }
                    .frame(minWidth: 800, minHeight: 550)
                    .border(.black)

                    VStack() {
                        HStack() {

                            Text("AI SCORE: \(AIScore)")

                            Spacer()

                            ZStack(alignment: .center){
                                Text(winCondition ? "Win" : "Lose")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .padding(
                                        EdgeInsets(
                                            top: 10,
                                            leading: 20,
                                            bottom: 10,
                                            trailing: 20
                                        )
                                    )
                            }
                            .frame(alignment: .center)
                            .background(winCondition ? .green : .red)

                            Spacer()

                            Text("HUMAN SCOR: \(humanScore)")

                        }
                    }
                    .frame(maxWidth: 800)

                    VStack() {
                        VStack() {

                            Text("make your move")

                            HStack(spacing: 45) {
                                ForEach(handGestures, id: \.self) { handGesture in
                                    Button() {
                                        madeHumanGesture(handGesture)
                                    } label: {
                                        Text(handGesture)
                                            .font(.system(size: 200))
                                    }
                                }
                            }
                            .frame(maxWidth: 800, maxHeight: 300)

                        }
                    }
                    .frame(maxWidth: 800, maxHeight: 550)
                    .border(.black)

                    Spacer()

                }
            }
            .ignoresSafeArea()

        }
        .alert(isMatchResultCorrect ? "Correct" : "Wrong", isPresented: $roundEnded) {
            Button(isMatchResultCorrect ? "Perfect!" : "Ooh!", action: updateGameStatus)
        }
        .alert(gameResult ? "You Win!" : "You Lose!", isPresented: $gameEnded) {
            Button("Restart", action: restartGame)
                .buttonStyle(.borderedProminent)
        } message: {
                Text("You: \(humanScore)\nAI: \(AIScore)")
        }
    }

    func madeHumanGesture(_ handGesture: String) {
        humanGesture = handGesture
        roundEnded = true
    }

    func updateGameStatus() {
        if round == 3 {
            gameEnded = true
        }else {
            newRound()
        }
    }

    func newRound() {
        round += 1
        if isMatchResultCorrect {
            humanScore += 1
        }else {
            AIScore += 1
        }
        winCondition = Bool.random()
        AIGesture = handGestures.randomElement()!
    }

    func restartGame() {
        round = 1
        humanScore = 0
        AIScore = 0
        winCondition = Bool.random()
        AIGesture = handGestures.randomElement()!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
