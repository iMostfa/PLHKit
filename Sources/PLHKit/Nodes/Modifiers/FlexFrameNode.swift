//
//  File.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import UIKit

extension PLHViewModifiers.FlexFrame: PLHKitNodeModifierResolvable {

    private class Node: PLHKitNodeModifier {

        var hierarchyIdentifier: String {
            "FlexFrame"
        }

        var viewModifier: PLHViewModifiers.FlexFrame!

        func update(viewModifier: PLHViewModifiers.FlexFrame, context: inout Context) {
            self.viewModifier = viewModifier
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass, node: AnyPDFNode) -> CGSize {
            LayoutAlgorithms
                .FlexFrame(flexFrame: viewModifier, node: node, screenScale: UIScreen.main.scale)
                .contentLayout(fittingSize: targetSize, pass: pass)
                .idealSize
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass, node: AnyPDFNode) {
            let geometry = LayoutAlgorithms
                .FlexFrame(flexFrame: viewModifier, node: node, screenScale: UIScreen.main.scale)
                .contentLayout(fittingSize: bounds.size, pass: pass)
            node.layout(
                in: container,
                bounds: bounds.update(to: geometry.frames[0].offsetBy(dx: bounds.rect.minX, dy: bounds.rect.minY)),
                pass: pass
            )
        }
    }

    func resolve(context: Context, cachedNodeModifier: AnyPDFNodeModifier?) -> AnyPDFNodeModifier {
        return (cachedNodeModifier as? Node) ?? Node()
    }
}
