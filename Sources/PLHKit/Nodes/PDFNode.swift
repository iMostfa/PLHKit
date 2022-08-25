//
//  PDFNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

public protocol PDFNode: AnyPDFNode {

    associatedtype PLHView: SomePLHView

    func update(view: PLHView, context: Context)
}

extension PDFNode {

    public func update(view: SomePLHView, context: Context) {
        update(view: view as! PLHView, context: context)
    }
}
