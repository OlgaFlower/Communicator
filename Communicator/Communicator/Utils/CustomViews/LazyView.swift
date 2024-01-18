//
//  LazyView.swift
//  Communicator
//
//  Created by Olha Bereziuk on 18.01.24.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        self.build()
    }
}
