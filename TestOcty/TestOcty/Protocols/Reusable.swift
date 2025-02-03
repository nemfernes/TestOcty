//
//  Reusable.swift
//  TestOcty
//
//  Created by Dmitry Kirpichev on 03.02.2025.
//


import Foundation
import UIKit

protocol Reusable: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension Reusable where Self: UIView {
    static var defaultReuseIdentifier: String {
        String(describing: self)
    }
}
