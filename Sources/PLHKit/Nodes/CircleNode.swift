//
//  Circle.swift
//  PLHKit
//
//  Created by Mostfa Essam on 14/08/2022.
//

import UIKit

extension Circle: PDFNodeResolvable  {

    private class Node: PDFNode {
        
        func update(view: Circle, context: Context) {
            self.circle = view
        }
        
        var circle: View?
        typealias View = Circle

        
        var hierarchyIdentifier: String {
            "Circle"
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
            
            guard let circle = circle else {
                assertionFailure("Can't get circle node.")
                return .zero
            }

            
            return .init(width: circle.height, height: circle.height)
      
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass) {
            let path = UIBezierPath.init(roundedRect: .init(origin: bounds.origin, size: bounds.size), cornerRadius: bounds.size.height / 2)

            let drawContext = container.renderer.cgContext
         
            drawContext.saveGState()
            drawContext.addPath(path.cgPath)
            drawContext.setFillColor(circle!.foregroundColor.cgColor)
            drawContext.fillPath()

            drawContext.restoreGState()
            
        }

    }

    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        return   Node()
    }
}

protocol ForegroundedView {
    var foregroundColor: UIColor { get set }
    func foregroundColor(_ color: UIColor) -> Self
}

extension ForegroundedView {
    
    func foregroundColor(_ color: UIColor) -> Self {
        var copy = self
        copy.foregroundColor = color
        return copy
    }
}
