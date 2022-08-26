//
//  AspectRatio.swift
//  
//
//  Created by Mostfa Essam on 26/08/2022.
//

import UIKit

extension PLHViewModifiers {

    public struct AspectRatio: PLHViewModifier {

        public let aspectRatio: CGFloat?
        public let contentMode: ContentMode

        @inlinable
        public init(_ aspectRatio: CGFloat?, contentMode: ContentMode) {
            self.aspectRatio = aspectRatio
            self.contentMode = contentMode
        }
    }
}

extension PLHView {

    @inlinable public func aspectRatio(_ aspectRatio: CGFloat? = nil, contentMode: ContentMode) -> ModifiedContent<Self, PLHViewModifiers.AspectRatio> {
        modifier(PLHViewModifiers.AspectRatio(aspectRatio, contentMode: contentMode))
    }

    @inlinable public func aspectRatio(_ aspectRatio: CGSize, contentMode: ContentMode) -> ModifiedContent<Self, PLHViewModifiers.AspectRatio> {
        modifier(PLHViewModifiers.AspectRatio(aspectRatio.width / aspectRatio.height, contentMode: contentMode))
    }

    @inlinable public func scaledToFit() -> ModifiedContent<Self, PLHViewModifiers.AspectRatio> {
        aspectRatio(contentMode: .fit)
    }

    @inlinable public func scaledToFill() -> ModifiedContent<Self, PLHViewModifiers.AspectRatio> {
        aspectRatio(contentMode: .fill)
    }

}

public enum ContentMode: Hashable, CaseIterable {
    case fit
    case fill
}
