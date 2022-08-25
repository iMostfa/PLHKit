//
//  MSPDFViewer.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import SwiftUI

struct MSPDFViewer: SwiftUI.View {
    let PDFPage: PDFPage
  
    init(_ creator: () -> PDFPage) {
        self.PDFPage = creator()
    }
    
    var body: some SwiftUI.View {
       // PDFViewSUI(data: self.PDFPage.body)
        PDFPreviewer(data: PDFPage.body)
    }
}

struct PDFCreatorPreview_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        MSPDFViewer.init {
            PDFPage {
                Text("Hello")
            }
        }
    }
}
