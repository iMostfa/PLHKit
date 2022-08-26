//
//  ZStack.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import Foundation

public struct ZStack<Content: PLHView>: PLHView {

    public typealias Body = Swift.Never

    public let tree: TreeView.Tree<Layouts.ZStack, Content>

    @inlinable
    public init(alignment: Alignment = .center, @PDFUIBuilder content: () -> Content) {
        tree = .init(root: .init(alignment: alignment), content: content())
    }
}
