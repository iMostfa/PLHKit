//
//  Layout.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation

public protocol Layout: Equatable {
    func layoutAlgorithm(nodes: [LayoutNode], env: EnvironmentValues) -> LayoutAlgorithm
}
