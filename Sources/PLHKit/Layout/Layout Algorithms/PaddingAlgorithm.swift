//
//  PaddingAlgorithm.swift
//  PLHKit
//
//  Created by Mostfa Essam on 20/08/2022.
//

import UIKit

extension LayoutAlgorithms {

    public class Padding: LayoutAlgorithm {

        public let padding: ViewModifiers.Padding

        /// Modified node
        public let node: LayoutNode

        /// Screen scale
        public let screenScale: CGFloat

        private let defaultPadding: CGFloat


        public init(padding: ViewModifiers.Padding, node: LayoutNode, defaultPadding: CGFloat, screenScale: CGFloat = 2) {
            self.padding = padding
            self.node = node
            self.screenScale = screenScale
            self.defaultPadding = defaultPadding
        }

        /// Calculate the stack geometry fitting `targetSize` and aligned by `alignment`.
        public func contentLayout(fittingSize targetSize: CGSize, pass: LayoutPass) -> ContentGeometry {

        

            let insets = EdgeInsets(
                top: padding.top ?? defaultPadding,
                leading: padding.leading ?? defaultPadding,
                bottom: padding.bottom ?? defaultPadding,
                trailing: padding.trailing ?? defaultPadding
            )

            let rect = CGRect(
                x: insets.leading,
                y: insets.top,
                width: targetSize.width - CGFloat(insets.leading + insets.trailing),
                height: targetSize.height - CGFloat(insets.top + insets.bottom)
            )

            let nodeSize = node.layoutSize(fitting: rect.size, pass: pass)

            let idealSize = CGSize(
                width: nodeSize.width + CGFloat(insets.leading + insets.trailing),
                height: nodeSize.height + CGFloat(insets.top + insets.bottom)
            )

            let geometry = ContentGeometry(idealSize: idealSize, frames: [rect])
            return geometry
        }
    }
}
