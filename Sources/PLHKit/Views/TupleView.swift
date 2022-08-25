//
//  TupleView.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation

extension TupleView: TransientContainerView {

    var contentViews: [SomePLHView] {
        Mirror(reflecting: value).children.flatMap { ($0.value as! SomePLHView).contentViews }
    }
    
}


public struct TupleView<T>: View {

    public typealias Body = Swift.Never

    public var value: T

    @inlinable
    public init(_ value: T) {
        self.value = value
    }
}
