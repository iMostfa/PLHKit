//
//  Alignment.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

public enum VerticalAlignment: Equatable {
    case top
    case center
    case bottom
    case firstTextBaseline
    case lastTextBaseline
}

public struct Alignment: Equatable {
    
    public var horizontal: HorizontalAlignment
    public var vertical: VerticalAlignment
    
    @inlinable
    public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
    
    public static let center: Alignment = Alignment(horizontal: .center, vertical: .center)
    public static let leading: Alignment = Alignment(horizontal: .leading, vertical: .center)
    public static let trailing: Alignment = Alignment(horizontal: .trailing, vertical: .center)
    public static let top: Alignment = Alignment(horizontal: .center, vertical: .top)
    public static let bottom: Alignment = Alignment(horizontal: .center, vertical: .bottom)
    public static let topLeading: Alignment = Alignment(horizontal: .leading, vertical: .top)
    public static let topTrailing: Alignment = Alignment(horizontal: .trailing, vertical: .top)
    public static let bottomLeading: Alignment = Alignment(horizontal: .leading, vertical: .bottom)
    public static let bottomTrailing: Alignment = Alignment(horizontal: .trailing, vertical: .bottom)
}





