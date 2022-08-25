//
//  ViewModifier.swift
//  PLHKit
//
//  Created by Mostfa Essam on 20/08/2022.
//

import Foundation

public enum PLHViewModifiers {
    
}


public protocol SomePLHViewModifier {

    func body(content: SomePLHView) -> SomePLHView
}


public protocol PLHViewModifier: SomePLHViewModifier {

    associatedtype Body: PLHView

    typealias Content = ViewModifierContent<Self>

    func body(content: Content) -> Body
}

extension PLHViewModifier {

    public func body(content: SomePLHView) -> SomePLHView {
        return (body(content: Content(content, modifier: self)) as Body) as SomePLHView
    }
}

extension PLHViewModifier where Body == Never {

    public func body(content: Content) -> Never {
        fatalError()
    }
}

public struct ViewModifierContent<VM: SomePLHViewModifier>: PLHView {

    public let view: SomePLHView
    public let modifier: VM

    public init(_ view: SomePLHView, modifier: VM) {
        self.view = view
        self.modifier = modifier
    }

    public var body: Never {
        fatalError()
    }
}
