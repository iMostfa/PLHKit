//
//  PDFUIBuilder.swift
//  PLHKit
//
//  Created by Mostfa Essam on 19/08/2022.
//

import Foundation

@resultBuilder struct PDFUIBuilder {
    static func buildArray<Content>(_ components: [Content]) -> TupleView<[Content]> where Content: PLHView {
        return TupleView.init(components)
    }
    
    
    public static func buildBlock<Content>(_ content: Content) -> Content where Content: PLHView {
        return content
    }
    
    static func buildOptional<Content> (_ component:Content?) -> Content? {
        return component
    }
    public static func buildBlock() -> EmptyView {
        return EmptyView()
    }
    
    
    
    static func buildEither<Content: PLHView>(second component: Content) -> Content  {
        return component
    }
    
    static func buildEither<Content: PLHView>(first component: Content) -> Content  {
        return component
    }
}

extension PDFUIBuilder {

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0: PLHView, C1: PLHView {
        return TupleView((c0, c1))
    }
}


//MARK: - Build Block For Tuple View
extension PDFUIBuilder {

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)> where C0: PLHView, C1: PLHView, C2: PLHView {
        return TupleView((c0, c1, c2))
    }



    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleView<(C0, C1, C2, C3)> where C0: PLHView, C1: PLHView, C2: PLHView, C3: PLHView {
        return TupleView((c0, c1, c2, c3))
    }



    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleView<(C0, C1, C2, C3, C4)> where C0: PLHView, C1: PLHView, C2: PLHView, C3: PLHView, C4: PLHView {
        return TupleView((c0, c1, c2, c3, c4))
    }



    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleView<(C0, C1, C2, C3, C4, C5)> where C0: PLHView, C1: PLHView, C2: PLHView, C3: PLHView, C4: PLHView, C5: PLHView {
        return TupleView((c0, c1, c2, c3, c4, c5))
    }



    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleView<(C0, C1, C2, C3, C4, C5, C6)> where C0: PLHView, C1: PLHView, C2: PLHView, C3: PLHView, C4: PLHView, C5: PLHView, C6: PLHView {
        return TupleView((c0, c1, c2, c3, c4, c5, c6))
    }



    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)> where C0: PLHView, C1: PLHView, C2: PLHView, C3: PLHView, C4: PLHView, C5: PLHView, C6: PLHView, C7: PLHView {
        return TupleView((c0, c1, c2, c3, c4, c5, c6, c7))
    }



    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)> where C0: PLHView, C1: PLHView, C2: PLHView, C3: PLHView, C4: PLHView, C5: PLHView, C6: PLHView, C7: PLHView, C8: PLHView {
        return TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8))
    }


    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)> where C0: PLHView, C1: PLHView, C2: PLHView, C3: PLHView, C4: PLHView, C5: PLHView, C6: PLHView, C7: PLHView, C8: PLHView, C9: PLHView {
        return TupleView((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9))
    }
}
