//
//  PDFPage.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import UIKit

public struct PDFPage {
    

    internal var content: SomePLHView
    
//    public var body: Data {
//        drawPage()
//    }
    
    public init(@PDFUIBuilder _ content: () -> SomePLHView) {
        self.content = content()
        
    }
    
}
