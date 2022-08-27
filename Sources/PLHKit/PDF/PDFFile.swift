//
//  PDFFile.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import UIKit

public struct PDFFile {
    
    var pages: [PDFPage] = []
    private var rect: CGRect
    private var renderer: UIGraphicsPDFRenderer
    
    public init(_ paper:  Paper = .A4, pages: PDFPage...) {
        self.pages = pages
        let paperSize = paper.size()
        let rect: CGRect =  .init(origin: .zero,
                                  size: .init(width: paperSize.width,
                                              height:paperSize.height))
        self.rect = rect
        self.renderer = UIGraphicsPDFRenderer.init(bounds: rect)
        
    }
    
    public var body: Data {
        drawFile(renderer: renderer)
    }
    
    internal func drawFile(renderer: UIGraphicsPDFRenderer) -> Data {
        
        
        let data = renderer.pdfData { context in
            for page in pages {
                context.beginPage()
                let content = page.content
                let resolvedNodes = content.resolve(context: .init(renderer: context), cachedNode: nil)
                
                //MARK: - Drawing Action
                resolvedNodes.layout(in: .init(renderer: context),
                                     bounds: .init(rect: rect),
                                     pass: .init())

            }
            
        }
        return data
    }
    
    
    
}

extension PDFFile {
    public enum Paper {
        case A4
        case custom(CGFloat, CGFloat)
        
        public func size() -> CGSize {
            switch self {
                
            case .A4:
                return .init(width: 595.28 , height: 841.89)
            case .custom(let width, let height):
                return .init(width: width, height: height)
            }
        }
    }
    
}
