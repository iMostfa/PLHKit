//
//  ContentGeometry.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import UIKit

/// Represents geometry of a container view content.
public struct ContentGeometry: Equatable {
    
    /// Ideal child bounding size.
    public let idealSize: CGSize
    
    /// Frames of child views relative to the container.
    public let frames: [CGRect]
    
    @inlinable
    public init(idealSize: CGSize, frames: [CGRect]) {
        self.idealSize = idealSize
        self.frames = frames
    }
}
