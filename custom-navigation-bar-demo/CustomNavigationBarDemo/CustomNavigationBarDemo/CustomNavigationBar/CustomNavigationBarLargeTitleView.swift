//
//  CustomNavigationBarBigTitleView.swift
//  CustomNavigationBarDemo
//
//  Created by Nguyen M. Tam on 16/05/2021.
//

import SwiftUI

struct CustomNavigationBarLargeTitleView<TitleView, TrailingView>: View where TitleView: View, TrailingView: View {

    let titleView: () -> TitleView
    let trailingView: () -> TrailingView

    init(
        @ViewBuilder titleView: @escaping () -> TitleView,
        @ViewBuilder trailingView: @escaping () -> TrailingView
    ) {
        self.titleView = titleView
        self.trailingView = trailingView
    }

    var body: some View {
        HStack(alignment: .center) {
            titleView().padding()
            Spacer()
            trailingView().padding()
        }
    }
}
