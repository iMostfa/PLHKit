//
//  ViewNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import UIKit

class ViewNode: PDFNode {
    
    func update(view: Never, context: Context) {
    
    }
    
    func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
        node.layoutSize(fitting: targetSize, pass: pass)
    }
    
    func layout(in container: Container, bounds: Bounds, pass: LayoutPass) {
        print("Layout view node in \n \(container)")
        node.layout(in: container, bounds: bounds, pass: pass)
    }
    

    var hierarchyIdentifier: String {
        "View<\(node.hierarchyIdentifier)>"
    }

    var node: AnyPDFNode!

    var view: SomePLHView!
    var context: Context!
    
}
