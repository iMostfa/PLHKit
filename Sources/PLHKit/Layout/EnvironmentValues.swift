//
//  EnvironmentValues.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

public struct EnvironmentValues: Hashable {

    public init() {}

    
    // MARK: Global

    public var foregroundColor: Color? = .black

    public var accentColor: Color? = .blue

    
    public var vStackSpacing: CGFloat = 0

    public var hStackSpacing: CGFloat = 10

    public var padding: CGFloat = 10

    public var hidden: Bool = false

    // MARK: Other

    public var isEnabled: Bool = true

    public var lineSpacing: CGFloat = 0

    public var allowsTightening: Bool = false

    public var lineLimit: Int? = nil

    public var minimumScaleFactor: CGFloat = 1
    
    // MARK: Private

    public var _layoutAxis: Axis? = nil


}


public enum Axis: Int8, CaseIterable {
    
    case vertical
    case horizontal

    public struct Set: OptionSet {

        public let rawValue: Int8

        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }

        public static let horizontal: Axis.Set = .init(rawValue: 1 << 0)
        public static let vertical: Axis.Set = .init(rawValue: 1 << 1)
    }

}
