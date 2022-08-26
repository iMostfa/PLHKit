//
//  Frame.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import UIKit

extension PLHViewModifiers {

    public struct Frame: PLHViewModifier, Layout {
        
        public let width: CGFloat?
        public let height: CGFloat?
        public let alignment: Alignment

        @inlinable
        public init(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) {
            self.width = width
            self.height = height
            self.alignment = alignment
        }

        public func layoutAlgorithm(nodes: [LayoutNode], env: EnvironmentValues) -> LayoutAlgorithm {
            return LayoutAlgorithms.Frame(frame: self, node: nodes.first!)
        }
    }
}

extension PLHView {

    @inlinable
    public func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> ModifiedContent<Self, PLHViewModifiers.Frame> {
        return modifier(PLHViewModifiers.Frame(width: width, height: height, alignment: alignment))
    }
}
