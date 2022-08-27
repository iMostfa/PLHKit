//
//  Rectangle.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit


public struct Rectangle: Shape, Equatable {

    public init(size: CGSize) {
        self.size = size
    }
    
    
    public init(width: CGFloat, height: CGFloat) {
        self.init(size: .init(width: width, height: height))
    }
    
    public var foregroundColor: UIColor = UIColor.black
    public var cornerRadius: CGFloat = 0
    var size: CGSize
    
    @inlinable
    public func path(in rect: CGRect) -> Path {
        return Path(rect)
    }
}

public enum RoundedCornerStyle: Hashable {
    case circular
    case continuous
}


extension Rectangle {
    public func cornerRadius(_ radii: CGFloat) -> Self {
        var copy = self
        copy.cornerRadius = radii
        return copy
    }
}

extension Rectangle: ForegroundedView { }
