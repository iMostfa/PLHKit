//
//  Spacer.swift
//  PLHKit
//
//  Created by Mostfa Essam on 23/08/2022.
//

import UIKit

public struct Spacer: View, Equatable {
    
    public typealias Body = Swift.Never

    public let minLength: CGFloat?

    @inlinable
    public init(minLength: CGFloat? = nil) {
        self.minLength = minLength
    }
}
