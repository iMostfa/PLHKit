//
//  VStack.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

extension LayoutAlgorithms {

    /// A VStack layout is just an HStack layout flipped in axis :)
    public struct VStack: LayoutAlgorithm {

        private var hStackLayout: LayoutAlgorithms.HStack

        public init(nodes: [LayoutNode], layout: Layouts.VStack, defaultSpacing: CGFloat) {
            hStackLayout = LayoutAlgorithms.HStack(
                nodes: nodes.map { $0.axisFlipped() },
                layout: .init(alignment: layout.alignment.flipped, spacing: layout.spacing),
                defaultSpacing: defaultSpacing
            )
        }

        public func contentLayout(fittingSize targetSize: CGSize, pass: LayoutPass) -> ContentGeometry {
            hStackLayout.contentLayout(
                fittingSize: CGSize(width: targetSize.height, height: targetSize.width),
                pass: pass
            ).flipped()
        }
    }
}



private extension ContentGeometry {

    func flipped() -> ContentGeometry {
        .init(
            idealSize: CGSize(width: idealSize.height, height: idealSize.width),
            frames: frames.map {
                CGRect(x: $0.origin.y, y: $0.origin.x, width: $0.size.height, height: $0.size.width)
            }
        )
    }
}
