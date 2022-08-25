//
//  Circle.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit

public struct Circle: Shape, Equatable {

    internal var height: CGFloat
    public var foregroundColor: UIColor = UIColor.blue
    
    public init(height: CGFloat) {
        self.height = height
    }

    @inlinable
    public func path(in rect: CGRect) -> Path {
        guard !rect.isEmpty else { return Path(CGRect.zero) }
        var rect = rect
        if rect.width < rect.height {
            rect.origin.y = (rect.height - rect.width) / 2
            rect.size.height = rect.width
        } else if rect.width > rect.height {
            rect.origin.x = (rect.width - rect.height) / 2
            rect.size.width = rect.height
        }
        return Path(ellipseIn: rect)
    }
}

extension Circle: ForegroundedView { }

