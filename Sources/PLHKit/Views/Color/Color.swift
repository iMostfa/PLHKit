//
//  Color.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit

public struct Color: View, Hashable {

    public typealias Body = Swift.Never

    public enum Storage: Hashable {
        case rgba(red: Double, green: Double, blue: Double, opacity: Double)
        case asset(name: String, bundle: Bundle?)
    }

    public let storage: Storage

    @inlinable
    public init(red: Double, green: Double, blue: Double, opacity: Double) {
        self.storage = .rgba(red: red, green: green, blue: blue, opacity: opacity)
    }
    @inlinable

    public init(white: Double, opacity: Double) {
        self.init(red: white, green: white, blue: white, opacity: opacity)
    }

    @inlinable
    public init(rgb: Int32, opacity: Double = 1.0) {
        self.init(
            red: Double((rgb >> 16) & 0xff) / 255.0,
            green: Double((rgb >> 8) & 0xff) / 255.0,
            blue: Double(rgb & 0xff) / 255.0,
            opacity: Double(opacity)
        )
    }

    @inlinable
    public init(_ name: String, bundle: Bundle? = nil) {
        self.storage = .asset(name: name, bundle: bundle)
    }

    public static let clear: Color = .init(red: 0, green: 0, blue: 0, opacity: 0)

    public static let black: Color = .init(red: 0, green: 0, blue: 0, opacity: 1)

    public static let white: Color = .init(red: 1, green: 1, blue: 1, opacity: 1)

    public static let gray: Color = .init(red: 0.75, green: 0.75, blue: 0.75, opacity: 1)

    public static let red: Color = .init(red: 1, green: 0, blue: 0, opacity: 1)

    public static let green: Color = .init(red: 0, green: 1, blue: 0, opacity: 1)

    public static let blue: Color = .init(red: 0, green: 0, blue: 1, opacity: 1)

    public static let orange: Color = .init(red: 1, green: 0.5, blue: 0, opacity: 1)

    public static let yellow: Color = .init(red: 1, green: 1, blue: 0, opacity: 1)

    public static let pink: Color = .init(red: 1, green: 0, blue: 1, opacity: 1)

    public static let purple: Color = .init(red: 1, green: 0, blue: 1, opacity: 1)

    @inlinable
    public func opacity(_ opacity: Double) -> Color {
        switch storage {
        case .rgba(let red, let green, let blue, let oldOpacity):
            return Color(red: red, green: green, blue: blue, opacity: oldOpacity * opacity)
        default:
            return self // TODO
        }
    }
}


extension Color {

    var uiColorValue: UIColor {
        switch storage {
        case .rgba(let red, let green, let blue, let alpha):
            return UIColor(
                red: CGFloat(red),
                green: CGFloat(green),
                blue: CGFloat(blue),
                alpha: CGFloat(alpha)
            )
        case .asset(let name, let bundle):
            if #available(iOS 11.0, *) {
                return UIColor(named: name, in: bundle, compatibleWith: nil)!
            } else {
                fatalError("Color assets are not available on iOS 10 or earlier.")
            }
        }
    }

    var cgColorValue: CGColor {
        return uiColorValue.cgColor
    }
}
