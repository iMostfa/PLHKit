//
//  TreeNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit


extension TreeView.Tree: PDFNodeResolvable {

    private class Node: PDFNode {

        var hierarchyIdentifier: String {
            "Tree<\(nodes.map(\.hierarchyIdentifier).joined(separator: ", "))>"
        }

        var nodes: [AnyPDFNode]!

        var layoutAlgorithm: LayoutAlgorithm!

        func update(view: SomePLHView, context: Context) {
            if let view = view as? VStack<Content> {
                self.nodes = view.tree.content.resolve(context: context, cachedNodes: nodes ?? [])
                self.layoutAlgorithm = view.tree.root.layoutAlgorithm(nodes: nodes, env: context.environment)
            } else if let view = view as? HStack<Content> {
                self.nodes = view.tree.content.resolve(context: context, cachedNodes: nodes ?? [])
                self.layoutAlgorithm = view.tree.root.layoutAlgorithm(nodes: nodes, env: context.environment)
            }  else {
                fatalError()
            }
        }

        func update(view: TreeView.Tree<Root, Content>, context: Context) {
            fatalError()
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
            layoutAlgorithm.contentLayout(fittingSize: targetSize, pass: pass).idealSize
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass = .init()) {
            let layout = layoutAlgorithm.contentLayout(fittingSize: bounds.size, pass: pass)
            zip(nodes, layout.frames).forEach { (node, frame) in
                node.layout(
                    in: container,
                    bounds: Bounds(
                        rect: frame.offsetBy(dx: bounds.origin.x, dy: bounds.origin.y)
                    ),
                    pass: pass
                )
            }
        }

    }

    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        return (cachedNode as? Node) ?? Node()
    }
}
