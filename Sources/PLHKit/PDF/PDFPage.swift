//
//  PDFPage.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import UIKit

struct PDFPage {
    
    enum Paper {
        case A4
        case custom(CGFloat, CGFloat)
        
        func size() -> CGSize {
            switch self {
                
            case .A4:
                return .init(width: 595.28 , height: 841.89)
            case .custom(let width, let height):
                return .init(width: width, height: height)
            }
        }
    }
    
    private let renderer:UIGraphicsPDFRenderer
    private var content: SomePLHView
    private var rect: CGRect
    
    var body: Data {
        drawPage()
    }
    
    init(_ paper:  Paper = .A4, @PDFUIBuilder _ content: () -> SomePLHView) {
        let paperSize = paper.size()
        let rect: CGRect =  .init(origin: .zero, size: .init(width: paperSize.width, height:paperSize.height))
        self.rect = rect
        self.renderer = UIGraphicsPDFRenderer(bounds: rect)
        self.content = content()
        
    }
    
    private func drawPage() -> Data {
        let data = renderer.pdfData { context in
            context.beginPage()
            let resolvedNodes = content.resolve(context: .init(renderer: context), cachedNode: nil)
            
            //MARK: - Drawing Action
            resolvedNodes.layout(in: .init(renderer: context),
                                         bounds: .init(rect: rect),
                                         pass: .init())

        }
        return data
    }
    
    

}
