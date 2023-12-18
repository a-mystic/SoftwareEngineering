//
//  Cloudy.swift
//  Project
//
//  Created by a mystic on 12/18/23.
//

import SwiftUI

struct Cloudy: View {
    var body: some View {
        GeometryReader { geometry in
            let insideWidth = geometry.size.width
            let insideHeight = geometry.size.height
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundStyle(.black.opacity(0.3).gradient)
                    .scaleEffect(1)
                    .frame(width: insideWidth , height: 100)
                elements(width: insideWidth, height: insideHeight)
            }
            .background(Color.gray.gradient)
        }
    }
    
    @ViewBuilder
    func elements(width: CGFloat, height: CGFloat) -> some View {
        Text("🌥️")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: -width / 3, y: -height / 3)
        Text("☁️")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: -width / 10, y: -height / 3.5)
        Text("☁️")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: -width / 5, y: -height / 3.5)
        Text("☁️")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: width / 4, y: -height / 3.5)
    }
}

struct Cloudy_Previews: PreviewProvider {
    static var previews: some View {
        Cloudy()
    }
}
