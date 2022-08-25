//
//  Padding.swift
//  PLHKit
//
//  Created by Mostfa Essam on 20/08/2022.
//

import UIKit


extension PLHViewModifiers {

    public struct Padding: PLHViewModifier, Layout {
        
        public let top: CGFloat?
        public let bottom: CGFloat?
        public let leading: CGFloat?
        public let trailing: CGFloat?

        @inlinable
        public init(top: CGFloat?, bottom: CGFloat?, leading: CGFloat?, trailing: CGFloat?) {
            self.top = top
            self.bottom = bottom
            self.leading = leading
            self.trailing = trailing
        }

        @inlinable
        public init(_ insets: EdgeInsets) {
            (top, bottom, leading, trailing) = (insets.top, insets.bottom, insets.leading, insets.trailing)
        }

        @inlinable
        public init(_ insets: CGFloat?) {
            (top, bottom, leading, trailing) = (insets, insets, insets, insets)
        }

        public func layoutAlgorithm(nodes: [LayoutNode], env: EnvironmentValues) -> LayoutAlgorithm {
            return LayoutAlgorithms.Padding(padding: self, node: nodes.first!, defaultPadding: env.padding)
        }
    }
}

extension PLHView {

    @inlinable
    public func padding(_ insets: EdgeInsets) -> ModifiedContent<Self, PLHViewModifiers.Padding> {
        return modifier(PLHViewModifiers.Padding(insets))
    }

    @inlinable
    public func padding(_ insets: CGFloat? = nil) -> ModifiedContent<Self, PLHViewModifiers.Padding> {
        return modifier(PLHViewModifiers.Padding(insets))
    }

    @inlinable
    public func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> ModifiedContent<Self, PLHViewModifiers.Padding> {
        return modifier(
            PLHViewModifiers.Padding(
                top: edges.contains(.top) ? length : 0,
                bottom: edges.contains(.bottom) ? length : 0,
                leading: edges.contains(.leading) ? length : 0,
                trailing: edges.contains(.trailing) ? length : 0
            )
        )
    }
}




public struct ModifiedContent<Content, Modifier>: PLHView where Content: PLHView, Modifier: PLHViewModifier {

    public typealias Body = Swift.Never

    public var content: Content
    public var modifier: Modifier

    @inlinable
    public init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}

extension ModifiedContent: Equatable where Content: Equatable, Modifier: Equatable {
}

extension PLHView {

    @inlinable
    public func modifier<Modifier: PLHViewModifier>(_ modifier: Modifier) -> ModifiedContent<Self, Modifier> {
        return ModifiedContent(content: self, modifier: modifier)
    }
}
