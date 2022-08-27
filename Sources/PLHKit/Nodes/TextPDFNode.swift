//
//  TextPDFNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//


import UIKit

extension Text: PDFNodeResolvable {
    func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        return Node()
    }
    
  
    private class Node: PDFNode {

        var hierarchyIdentifier: String {
            "Text"
        }

        var text: Text?
        var env: EnvironmentValues?


        func update(view: Text, context: Context) {
            (text, env) = (view, context.environment)
        }

        func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
            guard let text = text, let _ = env else { return .zero }
     
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .natural
            paragraphStyle.lineBreakMode = .byWordWrapping

            let textAttributes = [
              NSAttributedString.Key.paragraphStyle: paragraphStyle,
              NSAttributedString.Key.font: UIFont.init(name: text.font.fontName, size: text.fontSize)
            ]
            
            //TODO: - Reduce NSAttributedString Inits
            let attributedString = NSAttributedString.init(string: text.storage, attributes: textAttributes)
           
            let neededBoundingBox = attributedString.boundingRect(with: .init(width: targetSize.width, height: .infinity), options: [.usesFontLeading, .usesLineFragmentOrigin], context: nil)

            return neededBoundingBox.size
        }

        func layout(in container: Container, bounds: Bounds, pass: LayoutPass) {

            guard let text = text else { return }


            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .natural
            paragraphStyle.lineBreakMode = .byWordWrapping

            //TODO: - Reduce NSAttributedString Inits

            var textAttributes = [
              NSAttributedString.Key.paragraphStyle: paragraphStyle,
              NSAttributedString.Key.foregroundColor: text.foregroundColor,
              NSAttributedString.Key.font: UIFont.init(name: text.font.fontName, size: text.fontSize)
            ]
            
            
            if text.backgroundColor != UIColor.clear {
                textAttributes[NSAttributedString.Key.backgroundColor] = text.backgroundColor
            }
            
            let attributedString = NSAttributedString.init(string: text.storage, attributes: textAttributes)
         
            let neededBoundingBox = attributedString.boundingRect(with: .init(width: bounds.size.width, height: .infinity), options: [.usesFontLeading, .usesLineFragmentOrigin], context: nil)

            attributedString.draw(in: CGRect.init(origin: bounds.origin, size: neededBoundingBox.size))
            
        }

    }
    

}
