//
//  PDFBuilder.swift
//  PLHKit
//
//  Created by Mostfa Essam on 14/08/2022.
//

import Foundation
import UIKit

protocol PDFNodeResolvable {
    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode
}




public struct Bounds {
    public let rect: CGRect
    public let safeAreaInsets: EdgeInsets

    public init(rect: CGRect, safeAreaInsets: EdgeInsets = .zero) {
        self.rect = rect
        self.safeAreaInsets = safeAreaInsets

    }
    
    public func update(to newRect: CGRect) -> Bounds {
        Bounds(
            rect: newRect,
            safeAreaInsets: safeAreaInsets // TODO
        )
    }
}

extension Bounds {

    @inlinable
    public var origin: CGPoint {
        rect.origin
    }

    @inlinable
    public var size: CGSize {
        rect.size
    }
}
