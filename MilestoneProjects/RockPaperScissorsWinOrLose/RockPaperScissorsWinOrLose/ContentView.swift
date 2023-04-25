//
//  ContentView.swift
//  RockPaperScissorsWinOrLose
//
//  Created by Gökhan on 25.04.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var AIweapon: Weapon = Weapon.allCases.randomElement()!

    @State private var humanWeapon: Weapon = Weapon.allCases.randomElement()!

    var body: some View {
        VStack {
            Text("AI: \(AIweapon.rawValue)")
            Text("Human: \(humanWeapon.rawValue)")
            Text("Human Wins: \(match(humanWeapon, with: AIweapon).description)")
        }
        .padding()
    }

    enum Weapon: String, CaseIterable {
        case rock
        case paper
        case scissor
    }

    func match(_ humanWeapon: Weapon, with AIWeapon: Weapon) -> Bool {
        if humanWeapon == .rock && AIWeapon == .scissor {
            return true
        }else if humanWeapon == .paper && AIWeapon == .rock {
            return true
        }else if humanWeapon == .scissor && AIWeapon == .paper {
            return true
        }else {
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
