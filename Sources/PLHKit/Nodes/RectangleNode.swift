//
//  Rectangle.swift
//  PLHKit
//
//  Created by Mostfa Essam on 14/08/2022.
//

import UIKit

extension Rectangle: PDFNodeResolvable  {

    private class Node: PDFNode {
        
        func update(view: Rectangle, context: Context) {
            (rectangle, _) = (view, context.environment)
        }
        
        var rectangle: Rectangle?
        typealias View = Rectangle

        
        var hierarchyIdentifier: String {
            "Rectangle"
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
            
            let rect = targetSize
            let path = UIBezierPath.init(roundedRect: .init(origin: .zero, size: rect), cornerRadius: 10)
            
            print("Layout size \(path.bounds) ")
            return rectangle!.size
      
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass) {
            let path = UIBezierPath.init(roundedRect: .init(origin: bounds.origin, size: bounds.size), cornerRadius: 10)

            let drawContext = container.renderer.cgContext
         
            drawContext.saveGState()
            drawContext.addPath(path.cgPath)
            drawContext.setFillColor(rectangle!.foregroundColor.cgColor)
            drawContext.fillPath()

            drawContext.restoreGState()
            
        }

    }

    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        return   Node()
    }
}
