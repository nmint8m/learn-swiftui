//
//  ContentView.swift
//  CustomNavigationBarDemo
//
//  Created by Nguyen M. Tam on 16/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<79) { index in
                    Text("Item \(index)").padding()
                }
            }
            .navigationBarTitle("Lists")
            .navigationBarLargeTiltle(
                customView: CustomNavigationBarLargeTitleView(
                    titleView: { Text("List").font(.largeTitle).fontWeight(.bold) },
                    trailingView: {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .overlay(Button(
                                action: { print("Hello") },
                                label: { Image("icon-cat").resizable()}
                            ))
                    }
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
