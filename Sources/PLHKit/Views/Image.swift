//
//  Image.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import Foundation

public struct Image: PLHView, Hashable {

    public typealias Body = Swift.Never

    public let name: String
    public let bundle: Bundle?
    public private(set) var isResizable: Bool = false

    @inlinable
    public init(_ name: String, bundle: Bundle? = nil) {
        self.name = name
        self.bundle = bundle
    }
}

extension Image {

    public func resizable() -> Image {
        var copy = self
        copy.isResizable = true
        return copy
    }
}
