//
//  File.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import UIKit

extension PLHViewModifiers.AspectRatio: PLHKitNodeModifierResolvable {
      
    private class Node: PLHKitNodeModifier {

        var hierarchyIdentifier: String {
            "AspectRatio"
        }

        var viewModifier: PLHViewModifiers.AspectRatio!

        func update(viewModifier: PLHViewModifiers.AspectRatio, context: inout Context) {
            self.viewModifier = viewModifier
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass, node: AnyPDFNode) -> CGSize {
            let size = node.layoutSize(fitting: targetSize, pass: pass)
            let ratio = viewModifier.aspectRatio ?? size.width / size.height
            let targetRatio = targetSize.width / targetSize.height
            if targetRatio < ratio {
                return CGSize(width: targetSize.width, height: targetSize.height / ratio)
            } else {
                return CGSize(width: targetSize.width * ratio, height: targetSize.height)
            }
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass, node: AnyPDFNode) {
            node.layout(in: container, bounds: bounds, pass: pass)
        }
        
        
    }


    func resolve(context: Context, cachedNodeModifier: AnyPDFNodeModifier?) -> AnyPDFNodeModifier {
        return (cachedNodeModifier as? Node) ?? Node()
    }
    
}
