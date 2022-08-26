//
//  ZStackLayout.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import Foundation

extension Layouts {

    public struct ZStack: Layout, Equatable {

        public let alignment: Alignment

        @inlinable
        public init(alignment: Alignment = .center) {
            self.alignment = alignment
        }

        public func layoutAlgorithm(nodes: [LayoutNode], env: EnvironmentValues) -> LayoutAlgorithm {
            return LayoutAlgorithms.ZStack(nodes: nodes, layout: self)
        }
    }
}

extension ZStack: PDFNodeResolvable {

    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        tree.resolve(context: context, cachedNode: cachedNode)
    }
}
