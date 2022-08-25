//
//  HStack.swift
//  PLHKit
//
//  Created by Mostfa Essam on 14/08/2022.
//

import Foundation
import UIKit

public struct HStack<Content: PLHView>: PLHView {

    public typealias Body = Swift.Never

    public let tree: TreeView.Tree<Layouts.HStack, Content>

    @inlinable
    public init(alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @PDFUIBuilder content: () -> Content) {
        tree = .init(root: .init(alignment: alignment, spacing: spacing), content: content())
    }
}

extension HStack: PDFNodeResolvable {

    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        tree.resolve(context: context, cachedNode: cachedNode)
    }
}
