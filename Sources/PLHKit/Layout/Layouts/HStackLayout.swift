//
//  HStack.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

extension Layouts {

    public struct HStack: Layout, Equatable {

        public let alignment: VerticalAlignment
        public let spacing: CGFloat?

        @inlinable
        public init(alignment: VerticalAlignment, spacing: CGFloat?) {
            self.alignment = alignment
            self.spacing = spacing
        }

        public func layoutAlgorithm(nodes: [LayoutNode], env: EnvironmentValues) -> LayoutAlgorithm {
            return LayoutAlgorithms.HStack(nodes: nodes, layout: self, defaultSpacing: env.hStackSpacing)
        }
    }
}
