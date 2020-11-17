//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Nguyen M. Tam on 11/9/20.
//

import SwiftUI

struct ContentView: View {

  let rTarget = Double.random(in: 0..<1)
  let gTarget = Double.random(in: 0..<1)
  let bTarget = Double.random(in: 0..<1)

  @State var rGuess: Double
  @State var gGuess: Double
  @State var bGuess: Double
  @State var round: Int = 1
  @State var score: Int = 0
  @State var showAlert = false
  @State var showInfo = false

  private func computeScore() -> Int {
    let rDiff = rGuess - rTarget
    let gDiff = gGuess - gTarget
    let bDiff = bGuess - bTarget
    let diff = sqrt((rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 3.0)
    return lround((1.0 - diff) * 100.0)
  }

  private func resetSlidersValue() {
    rGuess = 0.5
    gGuess = 0.5
    bGuess = 0.5
  }

  var body: some View {
    VStack {

      HStack {

        VStack {
          Color(red: rTarget, green: gTarget, blue: bTarget)
          Text("Match this color 👆")
            .font(.footnote)
            .padding()
        }

        VStack {

          Color(red: rGuess, green: gGuess, blue: bGuess)

          HStack {
            ColorText(textColor: .red, colorName: "🔥", value: $rGuess)
            Spacer()
            ColorText(textColor: .green, colorName: "🌿", value: $gGuess)
            Spacer()
            ColorText(textColor: .blue, colorName: "💧", value: $bGuess)
          }
          .padding()
        }
      }
      .padding()

      ColorSlider(value: $rGuess, textColor: .red)
      ColorSlider(value: $gGuess, textColor: .green)
      ColorSlider(value: $bGuess, textColor: .blue)

      Button(action: { showAlert = true; round += 1; score += computeScore(); resetSlidersValue() }) {
        Text("Hit me!")
      }
      .alert(isPresented: $showAlert) {
        Alert(title: Text("Your score:"), message: Text(String(computeScore())))
      }
      .padding()

      HStack {
        Button(action: { round = 1; score = 0; resetSlidersValue() }) {
          Text("Start over")
        }
        Spacer()
        VStack {
          Text("Round: \(round)")
          Text("Score: \(score)")
        }
        Spacer()
        Button(action: { showInfo = true }) {
          Text("Info")
        }
        .sheet(isPresented: $showInfo) {
          InfoView(isPresented: $showInfo)
        }
        .previewLayout(.fixed(width: 45, height: 45))
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {

  static var previews: some View {
    Group {
      ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
        .previewLayout(.fixed(width: 568, height: 620))
    }
  }
}
