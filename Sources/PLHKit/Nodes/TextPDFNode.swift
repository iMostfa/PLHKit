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
              NSAttributedString.Key.font: UIFont.systemFont(ofSize: text.fontSize, weight: text.fontWeight)
            ]
            
            //TODO: - Reduce NSAttributedString Inits
            let attributedString = NSAttributedString.init(string: text.storage, attributes: textAttributes)

            return attributedString.size()
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
              NSAttributedString.Key.font: text.font
            ]
            
            
            if text.backgroundColor != UIColor.clear {
                textAttributes[NSAttributedString.Key.backgroundColor] = text.backgroundColor
            }
            let att = NSAttributedString.init(string: text.storage, attributes: textAttributes)
            att.draw(in: CGRect.init(origin: bounds.origin, size: bounds.size))
            
        }

    }
    

}
