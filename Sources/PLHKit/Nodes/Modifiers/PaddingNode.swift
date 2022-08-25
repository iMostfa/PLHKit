//
//  PaddingNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 20/08/2022.
//

import UIKit


extension ViewModifiers.Padding: UIKitNodeModifierResolvable {

    private class Node: UIKitNodeModifier {

        var hierarchyIdentifier: String {
            "Padding"
        }

        var defaultPadding: CGFloat!
        
        var viewModifier: ViewModifier!
        
        typealias ViewModifier = ViewModifiers.Padding

        func update(viewModifier: ViewModifiers.Padding, context: inout Context) {
            self.viewModifier = viewModifier
            self.defaultPadding = context.environment.padding
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass, node: AnyPDFNode) -> CGSize {
            guard let viewModifier = viewModifier else { return .zero }
            return LayoutAlgorithms
                .Padding(padding: viewModifier, node: node, defaultPadding: defaultPadding)
                .contentLayout(fittingSize: targetSize, pass: pass)
                .idealSize
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass, node: AnyPDFNode) {
            guard let viewModifier = viewModifier else { return }

            let geometry = LayoutAlgorithms
                .Padding(padding: viewModifier, node: node, defaultPadding: defaultPadding)
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

public protocol AnyPDFNodeModifier {

    var hierarchyIdentifier: String { get}

    var isSpacer: Bool { get }

    var layoutPriority: Double { get }

    func update(viewModifier: SomePLHViewModifier, context: inout Context)

    func layoutSize(fitting targetSize: CGSize, pass: LayoutPass, node: AnyPDFNode) -> CGSize

    func layout(in container: Container, bounds: Bounds, pass: LayoutPass, node: AnyPDFNode)
}

public protocol UIKitNodeModifier: AnyPDFNodeModifier {

    associatedtype ViewModifier: SomePLHViewModifier

    func update(viewModifier: ViewModifier, context: inout Context)
}

extension AnyPDFNodeModifier {

    public var isSpacer: Bool {
        false
    }

    public var layoutPriority: Double {
        0
    }

    func update(viewModifier: SomePLHViewModifier, context: inout Context) {
        
    }

    func layoutSize(fitting targetSize: CGSize, pass: LayoutPass, node: AnyPDFNode) -> CGSize {
        node.layoutSize(fitting: targetSize, pass: pass)
    }

    func layout(in container: Container, bounds: Bounds, pass: LayoutPass, node: AnyPDFNode) {
        node.layout(in: container, bounds: bounds, pass: pass)
    }
}

extension UIKitNodeModifier {

    public func update(viewModifier: SomePLHViewModifier, context: inout Context) {
        update(viewModifier: viewModifier as! ViewModifier, context: &context)
    }
}


protocol UIKitNodeModifierResolvable {
    func resolve(context: Context, cachedNodeModifier: AnyPDFNodeModifier?) -> AnyPDFNodeModifier
}

extension SomePLHViewModifier {

    public func resolve(context: inout Context, cachedNodeModifier: AnyPDFNodeModifier?) -> AnyPDFNodeModifier? {
        if let viewModifier = self as? UIKitNodeModifierResolvable {
            let resolvedNodeModifier = viewModifier.resolve(context: context, cachedNodeModifier: cachedNodeModifier)
            resolvedNodeModifier.update(viewModifier: self, context: &context)
            return resolvedNodeModifier
        } else {
            return nil
        }
    }
}

