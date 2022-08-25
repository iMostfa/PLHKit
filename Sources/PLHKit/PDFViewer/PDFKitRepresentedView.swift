//
//  PDFKitRepresentedView.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import SwiftUI
import PDFKit


typealias PDFPreviewer = PDFViewer.Previewer

enum PDFViewer {
    
    struct Previewer: UIViewRepresentable {
        
        typealias UIViewType = PDFView
        var data: Data
        
        init(data : Data) {
            self.data = data
        }
        
        func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFPreviewer>) {
                return
        }
      
        func makeUIView(context: UIViewRepresentableContext<PDFPreviewer>) -> UIViewType {
            let pdfView = PDFView()

       
                pdfView.document = PDFDocument(data: data)
    

            return pdfView
        }
    }

}
