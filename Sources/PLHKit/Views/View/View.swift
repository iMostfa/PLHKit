//
//  View.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

public protocol PLHView: SomePLHView {

    associatedtype Body: PLHView

    var body: Body { get }
}


extension PLHView {

    public var body: SomePLHView {
        return (body as Body) as SomePLHView
    }
}


//MARK: - SomePLHView
//TODO: - use some keyword
public protocol SomePLHView {

    var body: SomePLHView { get }
    
}

//SomePLHView + Resolve
extension SomePLHView {

    public var contentViews: [SomePLHView] {
        if let container = self as? TransientContainerView {
            return container.contentViews
        } else {
            return [self]
        }
    }

    public func resolve(context: Context, cachedNode: AnyPDFNode?) -> AnyPDFNode {
        let resolvedNode: AnyPDFNode
        if let view = self as? PDFNodeResolvable {
            resolvedNode = view.resolve(context: context, cachedNode: cachedNode)
        } else {
            resolvedNode = ViewNode.init()
        }
        resolvedNode.update(view: self, context: context)
        return resolvedNode
    }

    public func resolve(context: Context, cachedNodes: [AnyPDFNode]) -> [AnyPDFNode] {
        let views = contentViews
        if views.count == cachedNodes.count {
            return zip(views, cachedNodes).map {
                $0.resolve(context: context, cachedNode: $1)
            }
        } else {
            return views.map {
                $0.resolve(context: context, cachedNode: nil)
            }
        }
    }

}

typealias ElementDimensions = CGRect

protocol TransientContainerView {
    var contentViews: [SomePLHView] { get }
}
