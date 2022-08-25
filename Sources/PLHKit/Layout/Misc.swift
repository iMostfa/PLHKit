//
//  CGGraphics+ Extentions.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

extension MutableCollection {

    @inlinable
    mutating func mutableForEach(_ body: (inout Element) throws -> ()) rethrows {
        for index in indices {
            try body(&self[index])
        }
    }
}


extension CGFloat {

    @inlinable
    public func roundedToScale(scale: CGFloat, rule: FloatingPointRoundingRule) -> CGFloat {
        let scale: CGFloat = 1.0 / scale
        return scale * (self / scale).rounded(rule)
    }
}

extension CGSize {

    @inlinable
    public func roundedToScale(scale: CGFloat) -> CGSize {
        return CGSize(
            width: width.roundedToScale(scale: scale, rule: .awayFromZero),
            height: height.roundedToScale(scale: scale, rule: .awayFromZero)
        )
    }
}

extension CGPoint {

    @inlinable
    public func roundedToScale(scale: CGFloat) -> CGPoint {
        return CGPoint(
            x: x.roundedToScale(scale: scale, rule: .toNearestOrAwayFromZero),
            y: y.roundedToScale(scale: scale, rule: .toNearestOrAwayFromZero)
        )
    }
}

extension CGRect {

    @inlinable
    public func roundedToScale(scale: CGFloat) -> CGRect {
        return CGRect(
            origin: origin.roundedToScale(scale: scale),
            size: size.roundedToScale(scale: scale)
        )
    }
}
