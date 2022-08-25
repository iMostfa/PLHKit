//
//  PDFFile.swift
//  PLHKit
//
//  Created by Mostfa Essam on 21/08/2022.
//

struct PDFFile {
    var pages: [PDFPage] = []
    
    init(_ pages: () -> [PDFPage]) {
        
    }
    
    func page(_ page:  () -> PDFPage) {
        
    }
}
