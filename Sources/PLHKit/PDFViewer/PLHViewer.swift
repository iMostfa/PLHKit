//
//  PLHViewer.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import SwiftUI

public struct PLHViewer: View {
    let pdfFile: PDFFile
  
    public init(_ creator: () -> PDFFile) {
        self.pdfFile = creator()
    }
    
    public var body: some View {
        PDFPreviewer(data: pdfFile.body)
    }
}

public struct PDFCreatorPreview_Previews: PreviewProvider {
    public static var previews: some SwiftUI.View {
        PLHViewer.init {
            .init(pages: .init({
                Text("Hello world")
            }))
        }
    }
}
