//
//  LayoutAlgorithm.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit

public protocol LayoutAlgorithm {
    
    /// Calculate the stack geometry fitting `targetSize`.
    func contentLayout(fittingSize targetSize: CGSize, pass: LayoutPass) -> ContentGeometry
}

public enum LayoutAlgorithms {}
