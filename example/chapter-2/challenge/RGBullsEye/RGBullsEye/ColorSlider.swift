//
//  ColorSlider.swift
//  RGBullsEye
//
//  Created by Nguyen M. Tam on 11/17/20.
//

import SwiftUI

struct ColorSlider: View {

  @Binding var value: Double
  
  var textColor: Color

  var body: some View {
    HStack {
      Text("0")
        .foregroundColor(textColor)
      Slider(value: $value)
        .accentColor(textColor)
        .foregroundColor(textColor)
      Text("255")
        .foregroundColor(textColor)
    }
    .padding(.horizontal)
  }
}
