//
//  ContentView.swift
//  RockPaperScissorsWinOrLose
//
//  Created by Gökhan on 25.04.2023.
//

import SwiftUI

var handGestures = ["✊", "✋", "✌️"]

struct ContentView: View {
    
    let winCondition = Bool.random()
    

    @State private var AIGesture: String = handGestures.randomElement()!
    @State private var humanGesture: String = "Thinking"
    
    @State private var AIGestureMade = false
    @State private var humanGestureMade = false

    @State private var AIScore = 0
    @State private var humanScore = 0

    @State private var round = 1

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

    var body: some View {
        VStack(alignment: .center, spacing: 0) {

                Section() {
                    VStack() {
                        Text(AIGesture)
                            .font(.system(size: 200))
                    }
                    .frame(minWidth: 800, minHeight: 520)
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
                        Text("\(isHumanGestureCorrect.description)")
                        VStack() {
                            Text("make your move")
                            HStack(spacing: 45) {
                                ForEach(handGestures, id: \.self) { handGesture in
                                    Button() {
                                        madeHumanGesture(handGesture)
                                    } label: {
                                        Text(handGesture)
                                            .font(.system(size: 200))
                                            .opacity(changeOpacity(for: handGesture))
                                    }
                                }
                            }
                            .frame(maxWidth: 800, maxHeight: 300)
                        }
                    }
                    .frame(maxWidth: 800, maxHeight: 520)
                    .border(.black)
                }
            }
            .ignoresSafeArea()
    }

    func madeHumanGesture(_ handGesture: String) {
        humanGestureMade = true
        humanGesture = handGesture
        print(humanGesture)
    }
    
    func changeOpacity(for handGesture: String) -> Double {
        if humanGestureMade {
            if handGesture == self.humanGesture {
                return 100
            }else {
                return 0
            }
        }else {
            return 100
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
