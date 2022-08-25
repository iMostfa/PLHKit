//
//  VStack.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit


public enum HorizontalAlignment: Equatable {
    case leading
    case center
    case trailing
}

extension HorizontalAlignment {
    
    @inlinable
    public var flipped: VerticalAlignment {
        switch self {
        case .leading:
            return .top
        case .center:
            return .center
        case .trailing:
            return .bottom
        }
    }
}

public struct VStack<Content: PLHView>: PLHView {
    
    public typealias Body = Swift.Never
    
    public let tree: TreeView.Tree<Layouts.VStack, Content>
    
    @inlinable
    public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @PDFUIBuilder content: () -> Content) {
        tree = .init(root: .init(alignment: alignment, spacing: spacing), content: content())
    }
}


extension VStack: PDFNodeResolvable {

    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        tree.resolve(context: context, cachedNode: cachedNode)
    }
}

