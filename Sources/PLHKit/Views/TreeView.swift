//
//  TreeView.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation

public enum TreeView: View {
    
    public typealias Body = Swift.Never
    
    public struct Tree<Root: Layout, Content: View>: View {
        
        public typealias Body = Swift.Never
        
        public var root: Root
        public var content: Content
        
        @inlinable
        internal init(root: Root, content: Content) {
            self.root = root
            self.content = content
        }
        
        @inlinable
        public init(_ root: Root, @PDFUIBuilder content: () -> Content) {
            self.root = root
            self.content = content()
        }
    }
}
