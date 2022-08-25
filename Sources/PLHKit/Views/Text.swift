//
//  Text.swift
//  PLHKit
//
//  Created by Mostfa Essam on 14/08/2022.
//

import UIKit

public struct Text: PLHView, Hashable, ForegroundedView {
   
    public var foregroundColor: UIColor = UIColor.systemBlue
    internal var backgroundColor: UIColor = .clear
    internal var fontWeight: UIFont.Weight = .regular
    internal var fontSize: CGFloat = 13
    public typealias Body = Swift.Never

    public let storage: String

    @inlinable
    public init(_ text: String) {
        self.storage = (text)
    }

}

extension Text {
    public func fontSize(_ size: CGFloat) -> Self {
        var copy = self
        copy.fontSize = size
        return copy
    }
    public func fontWeight(_ weight: UIFont.Weight) -> Self {
        var copy = self
        copy.fontWeight = weight
        return copy

    }
    
    public func background(color: UIColor) -> Self {
        var copy = self
        copy.backgroundColor = color
        return copy
    }
}
