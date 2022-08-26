//
//  ImageNode.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import UIKit

extension Image: PDFNodeResolvable {
  
  private class Node: PDFNode {
    
    var hierarchyIdentifier: String {
        "Image"
    }
    
    var image: UIImage?
    var isResizable: Bool = false
    
    
    func update(view: Image, context: Context) {
      isResizable = view.isResizable
      image = UIImage(named: view.name)
    }
    
    func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
      if isResizable {
        return targetSize
      } else {
        return image?.size ?? .zero
      }
    }
    
    func layout(in container: Container, bounds: Bounds, pass: LayoutPass) {
        guard let image = image else {
            return assertionFailure("Image wasn't set")
        }

        image.draw(in: .init(origin: bounds.origin, size: bounds.size))
    }
    
  }
  
  func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
      return Node()
  }
}
