//
//  PLHViewer.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import SwiftUI

public struct PLHViewer: View {
    let PDFPage: PDFPage
  
    public init(_ creator: () -> PDFPage) {
        self.PDFPage = creator()
    }
    
    public var body: some View {
        PDFPreviewer(data: PDFPage.body)
    }
}

public struct PDFCreatorPreview_Previews: PreviewProvider {
    public static var previews: some SwiftUI.View {
        PLHViewer.init {
            PDFPage {
                Text("Hello")
            }
        }
    }
}
