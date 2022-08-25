//
//  PDFKitRepresentedView.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

import SwiftUI
import PDFKit


public typealias PDFPreviewer = PDFViewer.Previewer

public enum PDFViewer {
    
   public struct Previewer: UIViewRepresentable {
        
       public typealias UIViewType = PDFView
        var data: Data
        
        init(data : Data) {
            self.data = data
        }
        
       public func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFPreviewer>) {
                return
        }
      
       public func makeUIView(context: UIViewRepresentableContext<PDFPreviewer>) -> UIViewType {
           
           let pdfView = PDFView()
           pdfView.autoScales = true
           pdfView.document = PDFDocument(data: data)
           return pdfView
       }
    }

}
