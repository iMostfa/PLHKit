//
//  FrameAlgorithm.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

extension LayoutAlgorithms {

    public struct Frame: LayoutAlgorithm {

        public let frame: PLHViewModifiers.Frame

        /// Modified node
        public let node: LayoutNode

        /// Screen scale
        public let screenScale: CGFloat

        public init(frame: PLHViewModifiers.Frame, node: LayoutNode, screenScale: CGFloat = 2) {
            self.frame = frame
            self.node = node
            self.screenScale = screenScale
        }

        /// Calculate the stack geometry fitting `targetSize` and aligned by `alignment`.
        public func contentLayout(fittingSize targetSize: CGSize, pass: LayoutPass) -> ContentGeometry {
            var targetSize = targetSize
            if let width = frame.width {
                targetSize.width = min(targetSize.width, width)
            }
            if let height = frame.height {
                targetSize.height = min(targetSize.height, height)
            }

            var viewSize = node.layoutSize(fitting: targetSize, pass: pass)
            if let width = frame.width {
                viewSize.width = max(viewSize.width, width)
            }
            if let height = frame.height {
                viewSize.height = max(viewSize.height, height)
            }

            let rect: CGRect
            switch frame.alignment {
            case .center:
                rect = CGRect(
                    x: (targetSize.width - viewSize.width) / 2,
                    y: (targetSize.height - viewSize.height) / 2,
                    width: viewSize.width,
                    height: viewSize.height
                )
            default:
                fatalError("TODO")
            }

            return ContentGeometry(idealSize: rect.size, frames: [rect])
        }
    }
}
