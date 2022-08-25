//
//  Never+ View.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation

extension Never: View {
    
    public var body: Never {
        fatalError()
    }
}


extension View where Body == Never {

    public var body: Never {
        fatalError()
    }
}
