//
//  Shape.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation
import UIKit

public protocol Shape: View {

    func path(in rect: CGRect) -> Path
}

extension Shape {

    public static var typeIdentifier: String {
        String(reflecting: self)
    }

    public var body: ShapeView<Self, ForegroundStyle> {
        return ShapeView(shape: self, style: ForegroundStyle())
    }
}

public protocol ShapeStyle {
}



public struct ForegroundStyle: ShapeStyle {

    @inlinable public init() {}
}

public struct ShapeView<S: Shape, SS: ShapeStyle>: View {

    public typealias Body = Swift.Never

    public let shape: S
    public let style: SS

    @inlinable
    public init(shape: S, style: SS) {
        self.shape = shape
        self.style = style
    }
}

public struct FillShapeStyle: ShapeStyle {

    public let content: ShapeStyle

    @inlinable
    public init(content: ShapeStyle) {
        self.content = content
    }
}

public struct StrokeShapeStyle: ShapeStyle {

    public let content: ShapeStyle
    public let lineWidth: CGFloat

    @inlinable
    public init(content: ShapeStyle, lineWidth: CGFloat) {
        self.content = content
        self.lineWidth = lineWidth
    }
}

extension Color: ShapeStyle {}

extension Shape {

    @inlinable
    public func fill<S: ShapeStyle>(_ content: S) -> ShapeView<Self, FillShapeStyle> {
        return ShapeView(shape: self, style: FillShapeStyle(content: content))
    }

    @inlinable
    public func stroke<S: ShapeStyle>(_ content: S, lineWidth: CGFloat = 1) -> ShapeView<Self, StrokeShapeStyle> {
        return ShapeView(shape: self, style: StrokeShapeStyle(content: content, lineWidth: lineWidth))
    }
}
