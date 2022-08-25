//
//  Context.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

public struct Context {

    public var environment: EnvironmentValues = .init()
    
    public var environmentObjects: [String: Any] = [:]

//    public var transaction: Transaction = .init()

    public var renderer: UIGraphicsPDFRendererContext? = nil

    public init(renderer: UIGraphicsPDFRendererContext) { self.renderer = renderer }
}

extension Context {

    @inlinable
    public func environmentObject<B>(_ object: B) -> Context {
        var copy = self
        copy.environmentObjects[String(reflecting: B.self)] = object
        return copy
    }
}
