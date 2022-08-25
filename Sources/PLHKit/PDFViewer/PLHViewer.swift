//
//  PLHViewer.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import SwiftUI

struct PLHViewer: View {
    let PDFPage: PDFPage
  
    init(_ creator: () -> PDFPage) {
        self.PDFPage = creator()
    }
    
    var body: some View {
       // PDFViewSUI(data: self.PDFPage.body)
        PDFPreviewer(data: PDFPage.body)
    }
}

struct PDFCreatorPreview_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        PLHViewer.init {
            PDFPage {
                Text("Hello")
            }
        }
    }
}
