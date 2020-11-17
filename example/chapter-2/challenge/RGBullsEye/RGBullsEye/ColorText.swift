//
//  ColorText.swift
//  RGBullsEye
//
//  Created by Nguyen M. Tam on 11/17/20.
//

import SwiftUI

struct ColorText: View {

  var textColor: Color
  var colorName: String

  @Binding var value: Double

  var body: some View {
    Text("\(colorName) \(Int(value * 255))")
      .foregroundColor(textColor)
      .font(.footnote)
  }
}
