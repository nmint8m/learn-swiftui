//
//  View+CustomNavigationBarLargeTitle.swift
//  CustomNavigationBarDemo
//
//  Created by Nguyen M. Tam on 16/05/2021.
//

import SwiftUI

public extension View {

    func navigationBarLargeTiltle<Content>(customView: Content) -> some View where Content: View {
        overlay(NavigationBarLargeTiltleRepresenting(customView: customView).frame(width: 0, height: 0))
    }
}

private struct NavigationBarLargeTiltleRepresenting<Content: View>: UIViewControllerRepresentable {

    typealias UIViewControllerType = Wrapper

    private let customView: Content

    init(customView: Content) {
        self.customView = customView
    }

    func makeUIViewController(context: Context) -> Wrapper {
        Wrapper(representable: self)
    }

    func updateUIViewController(_ uiViewController: Wrapper, context: Context) { }
}

extension NavigationBarLargeTiltleRepresenting {

    class Wrapper: UIViewController {

        private let representable: NavigationBarLargeTiltleRepresenting

        init(representable: NavigationBarLargeTiltleRepresenting) {
            self.representable = representable
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError()
        }

        override func viewWillAppear(_ animated: Bool) {
            guard
                let navigationBar = navigationController?.navigationBar,
                let LargeTitleViewClass = NSClassFromString("_UINavigationBarLargeTitleView"),
                let largeTitleView = navigationBar.subviews.first(where: { $0.isKind(of:  LargeTitleViewClass.self) })
            else { return }
            let controller = UIHostingController(rootView: representable.customView)
            controller.view.clipsToBounds = true
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            navigationBar.addSubview(controller.view)
            NSLayoutConstraint.activate([
                controller.view.leadingAnchor.constraint(equalTo: largeTitleView.leadingAnchor),
                controller.view.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor),
                controller.view.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor),
                controller.view.heightAnchor.constraint(equalTo: largeTitleView.heightAnchor)
            ])
            super.viewWillAppear(animated)
        }
    }
}
