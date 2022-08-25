//
//  AnyPDFNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

public protocol AnyPDFNode: LayoutNode {

    var hierarchyIdentifier: String { get }

    var isSpacer: Bool { get }

    var layoutPriority: Double { get }

    func update(view: SomePLHView, context: Context)

    func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize

    func layout(in container: Container, bounds: Bounds, pass: LayoutPass)
}


extension AnyPDFNode {

    public var isSpacer: Bool {
        false
    }

    public var layoutPriority: Double {
        0
    }
}

