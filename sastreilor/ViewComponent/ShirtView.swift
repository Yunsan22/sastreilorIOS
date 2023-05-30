//
//  ShirtView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/6/23.
//

import SwiftUI

struct ShirtView: View {
    var body: some View {
        ShirtShape()
    }
}

struct ShirtView_Previews: PreviewProvider {
    static var previews: some View {
        ShirtView()
    }
}

struct ShirtShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9923*width, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        return path
    }
}
