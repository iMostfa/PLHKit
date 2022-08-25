//
//  ViewModifier.swift
//  PLHKit
//
//  Created by Mostfa Essam on 20/08/2022.
//

import Foundation

public enum ViewModifiers {
    
}


public protocol SomePLHViewModifier {

    func body(content: SomePLHView) -> SomePLHView
}


public protocol ViewModifier: SomePLHViewModifier {

    associatedtype Body: View

    typealias Content = ViewModifierContent<Self>

    func body(content: Content) -> Body
}

extension ViewModifier {

    public func body(content: SomePLHView) -> SomePLHView {
        return (body(content: Content(content, modifier: self)) as Body) as SomePLHView
    }
}

extension ViewModifier where Body == Never {

    public func body(content: Content) -> Never {
        fatalError()
    }
}

public struct ViewModifierContent<VM: SomePLHViewModifier>: View {

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
