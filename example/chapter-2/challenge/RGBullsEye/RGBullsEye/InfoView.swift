//
//  InfoView.swift
//  RGBullsEye
//
//  Created by Nguyen M. Tam on 11/17/20.
//

import SwiftUI

struct InfoView: View {

  @Binding var isPresented: Bool

  var body: some View {
    VStack {
      Text("Contributor: @nmint8m")
      Button(action: { isPresented = false }) {
        Text("Close")
      }
    }
  }
}
