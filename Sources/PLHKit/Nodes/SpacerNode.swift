//
//  SpacerNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 23/08/2022.
//

import UIKit

extension Spacer: PDFNodeResolvable {

    private class Node: PDFNode {

        var hierarchyIdentifier: String {
            "Spacer"
        }

        var view: Spacer!
        var context: Context!

        var isSpacer: Bool {
            true
        }

        var minLenght: CGFloat {
            return view.minLength ?? context.environment.padding
        }

        func update(view: Spacer, context: Context) {
            self.view = view
            self.context = context
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
            switch context.environment._layoutAxis {
            case .horizontal:
                return CGSize(width: minLenght, height: 0)
            case .vertical:
                return CGSize(width: 0, height: minLenght)
            default:
                return CGSize(width: minLenght, height: minLenght)
            }
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass) {
        }
    }

    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        return (cachedNode as? Node) ?? Node()
    }
}
