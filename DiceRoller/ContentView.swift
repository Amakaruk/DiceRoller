//
//  ContentView.swift
//  DiceRoller
//
//  Created by Aaron Makaruk on 1/21/26.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 2

    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)

            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            .padding()

            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)

                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice > 4)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .labelStyle(.iconOnly)
        .font(.title)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
