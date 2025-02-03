//
//  Designable.swift
//  TestOcty
//
//  Created by Dmitry Kirpichev on 03.02.2025.
//


import Foundation
import UIKit

protocol Designable: AnyObject {
    /// Setup view parameters (e.g. set colors, fonts, etc)
    func setupView()
    /// Set up subviews hierarchy
    func addSubviews()
    /// Add constraints
    func makeConstraints()
}

extension Designable where Self: UIView {
    func setupView() {
        // Empty body to make method optional
    }

    func addSubviews() {
        // Empty body to make method optional
    }

    func makeConstraints() {
        // Empty body to make method optional
    }
}
