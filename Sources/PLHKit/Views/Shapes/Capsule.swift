//
//  Capsule.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit
public struct Capsule: Shape, Equatable {

    public var style: RoundedCornerStyle

    @inlinable
    public init(style: RoundedCornerStyle = .circular) {
        self.style = style
    }

    @inlinable
    public func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        guard rect.width >= radius * 2 else { return Path(CGRect.zero) }
        guard rect.height >= radius * 2 else { return Path(CGRect.zero) }
        return Path(roundedRect: rect, cornerRadius: radius)
    }
}
