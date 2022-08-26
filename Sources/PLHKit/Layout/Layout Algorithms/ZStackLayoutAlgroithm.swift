//
//  File.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import UIKit

extension LayoutAlgorithms {

    public class ZStack: LayoutAlgorithm {

        public let nodes: [LayoutNode]
        public let layout: Layouts.ZStack


        public init(nodes: [LayoutNode], layout: Layouts.ZStack) {
            self.nodes = nodes
            self.layout = layout
        }

        /// Calculate the stack geometry fitting `targetSize`.
        public func contentLayout(fittingSize targetSize: CGSize, pass: LayoutPass) -> ContentGeometry {
    

            var idealSize: CGSize = .zero
            let frames = nodes.map { (node) -> CGRect in
                let size = node.layoutSize(fitting: targetSize, pass: pass)
                var alignedBounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                switch layout.alignment.horizontal {
                case .leading:
                    alignedBounds.origin.x = 0
                case .center:
                    alignedBounds.origin.x = (targetSize.width - size.width) / 2
                case .trailing:
                    alignedBounds.origin.x = targetSize.width - size.width
                }
                switch layout.alignment.vertical {
                case .top:
                    alignedBounds.origin.y = 0
                case .center:
                    alignedBounds.origin.y = (targetSize.height - size.height) / 2
                case .bottom:
                    alignedBounds.origin.y = targetSize.height - size.height
                case .firstTextBaseline, .lastTextBaseline:
                    fatalError()
                }
                idealSize = CGSize(width: max(idealSize.width, size.width), height: max(idealSize.height, size.height))
                return alignedBounds
            }

            let geometry = ContentGeometry(idealSize: idealSize, frames: frames)
            return geometry
        }
    }
}
