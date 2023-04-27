//
//  ContentView.swift
//  RockPaperScissorsWinOrLose
//
//  Created by Gökhan on 25.04.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var weapons = ["rock", "paper", "scissors"]
    
    @State private var AIWeapon: String = "paper"
    @State var humanWeapon: String = "Thinking"
    
    @State private var AIWeaponSelected = true
    @State private var humanWeaponSelected = false
    
    var matchResult: String {
        if humanWeapon == "rock" && AIWeapon == "scissors" {
            return "win"
        }else if humanWeapon == "paper" && AIWeapon == "rock" {
            return "win"
        }else if humanWeapon == "scissors" && AIWeapon == "paper" {
            return "win"
        }else if humanWeapon == AIWeapon {
            return "nothing happens"
        }else {
            return "lost"
        }
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack() {
                Text("AI: \(AIWeapon)")
            }
            .frame(minWidth: 800, minHeight: 500)
            .border(.black)
            
            VStack(alignment: .center, spacing: 50){
                Text("\(matchResult)")
                
                VStack(){
                    Text("Choose your weapon")
                    HStack(spacing: 50) {
                        ForEach(weapons, id: \.self) { weapon in
                            Button {
                                selectHumanWeapon(weapon)
                            } label: {
                                Text(weapon)
                            }
                        }
                    }
                }
            }
            .frame(minWidth: 800, minHeight: 500)
            .border(.black)
        }
    }
    func selectHumanWeapon(_ weapon: String) {
        humanWeaponSelected = true
        humanWeapon = weapon
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
