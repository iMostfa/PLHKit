//
//  VStack.swift
//  PLHKit
//
//  Created by Mostfa Essam on 14/08/2022.
//

import Foundation
import UIKit

public enum Layouts {}

extension Layouts {

    public struct VStack: Layout, Equatable {

        public let alignment: HorizontalAlignment
        public let spacing: CGFloat?

        @inlinable
        public init(alignment: HorizontalAlignment, spacing: CGFloat?) {
            self.alignment = alignment
            self.spacing = spacing
        }

        public func layoutAlgorithm(nodes: [LayoutNode], env: EnvironmentValues) -> LayoutAlgorithm {
            return LayoutAlgorithms.VStack(nodes: nodes, layout: self, defaultSpacing: env.vStackSpacing)
        }
    }
}


public struct LayoutPass: Hashable {
    
    public let uuid = UUID()
    
    public init() {
    }
}

