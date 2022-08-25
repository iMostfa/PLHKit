//
//  RoundedRectangle.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit

public struct RoundedRectangle: Shape, Equatable {

    public var cornerSize: CGSize
    public var style: RoundedCornerStyle

    @inlinable
    public init(cornerSize: CGSize, style: RoundedCornerStyle = .circular) {
        self.cornerSize = cornerSize
        self.style = style
    }

    @inlinable
    public init(cornerRadius: CGFloat, style: RoundedCornerStyle = .circular) {
        self.cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        self.style = style
    }

    @inlinable
    public func path(in rect: CGRect) -> Path {
        guard rect.width >= cornerSize.width * 2 else { return Path(CGRect.zero) }
        guard rect.height >= cornerSize.height * 2 else { return Path(CGRect.zero) }
        return Path(roundedRect: rect, cornerSize: cornerSize)
    }
}
