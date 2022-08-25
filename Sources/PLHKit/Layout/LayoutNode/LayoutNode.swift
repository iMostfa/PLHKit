//
//  LayoutNode.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit

public protocol LayoutNode {
    
    var isSpacer: Bool { get }
    var layoutPriority: Double { get }
    
    func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize
}

extension LayoutNode {
    
    public func axisFlipped() -> LayoutNode {
        return AxisFlippedLayoutNode.init(layoutNode: self)
    }
}

private struct AxisFlippedLayoutNode: LayoutNode {
    
    let layoutNode: LayoutNode
    
    var isSpacer: Bool {
        layoutNode.isSpacer
    }
    
    var layoutPriority: Double {
        layoutNode.layoutPriority
    }
    
    func layoutSize(fitting targetSize: CGSize, pass: LayoutPass) -> CGSize {
        let targetSize = CGSize(width: targetSize.height, height: targetSize.width)
        let size = layoutNode.layoutSize(fitting: targetSize, pass: pass)
        return CGSize(width: size.height, height: size.width)
    }
}
