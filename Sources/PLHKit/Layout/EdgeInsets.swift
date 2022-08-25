//
//  EdgeInsets.swift
//  PLHKit
//
//  Created by Mostfa Essam on 20/08/2022.
//

import UIKit

public struct EdgeInsets {

    public var top: CGFloat
    public var leading: CGFloat
    public var bottom: CGFloat
    public var trailing: CGFloat

    @inlinable
    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }

    @inlinable
    public init(_ value: CGFloat) {
        self.top = value
        self.leading = value
        self.bottom = value
        self.trailing = value
    }

    @inlinable
    public init() {
        self.top = 0
        self.leading = 0
        self.bottom = 0
        self.trailing = 0
    }

    @inlinable
    public static var zero: EdgeInsets {
        return .init()
    }
}

public enum Edge: Int8, CaseIterable, Hashable {

    case top
    case leading
    case bottom
    case trailing

    public struct Set: OptionSet {

        public typealias Element = Edge.Set

        public let rawValue: Int8

        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }

        public static let top = Edge.Set(.top)
        public static let leading = Edge.Set(.leading)
        public static let bottom = Edge.Set(.bottom)
        public static let trailing = Edge.Set(.trailing)
        public static let all: Edge.Set = [.top, .leading, .bottom, .trailing]
        public static let horizontal: Edge.Set = [.leading, .trailing]
        public static let vertical: Edge.Set = [.top, .bottom]

        public init(_ e: Edge) {
            self.init(rawValue: 1 << e.rawValue)
        }
    }
}
