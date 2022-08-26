//
//  FlexFrame.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import UIKit

extension PLHViewModifiers {

    public struct FlexFrame: PLHViewModifier, Layout {

        public let minWidth: CGFloat?
        public let idealWidth: CGFloat?
        public let maxWidth: CGFloat?

        public let minHeight: CGFloat?
        public let idealHeight: CGFloat?
        public let maxHeight: CGFloat?

        public let alignment: Alignment

        @inlinable
        public init(minWidth: CGFloat?, idealWidth: CGFloat?, maxWidth: CGFloat?, minHeight: CGFloat?, idealHeight: CGFloat?, maxHeight: CGFloat?, alignment: Alignment) {
            self.minWidth = minWidth
            self.idealWidth = idealWidth
            self.maxWidth = maxWidth
            self.minHeight = minHeight
            self.idealHeight = idealHeight
            self.maxHeight = maxHeight
            self.alignment = alignment
        }

        public func layoutAlgorithm(nodes: [LayoutNode], env: EnvironmentValues) -> LayoutAlgorithm {
            return LayoutAlgorithms.FlexFrame(flexFrame: self, node: nodes.first!)
        }
    }
}

extension PLHView {

    @inlinable
    public func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> ModifiedContent<Self, PLHViewModifiers.FlexFrame> {
        return modifier(PLHViewModifiers.FlexFrame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight, alignment: alignment))
    }
}
