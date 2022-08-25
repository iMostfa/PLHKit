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
    
    public var foregroundColor: UIColor = UIColor.black
    
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


extension Rectangle: ForegroundedView {


}
