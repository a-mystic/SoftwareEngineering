//
//  Sunny.swift
//  Project
//
//  Created by a mystic on 11/28/23.
//

import SwiftUI

struct Sunny: View {
    var body: some View {
        GeometryReader { geometry in
            let insideWidth = geometry.size.width
            let insideHeight = geometry.size.height
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(.brown)
                    .scaleEffect(1)
                    .frame(width: insideWidth , height: 15)
                elements(width: insideWidth, height: insideHeight)
            }
            .background(Color.blue)
        }
    }
    
    @ViewBuilder
    func elements(width: CGFloat, height: CGFloat) -> some View {
        Text("🌲")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: -width / 3, y: height / 3)
        Text("⛱️")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: width / 3, y: height / 3)
        Text("🌻")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: width / 6, y: height / 3)
        Text("☀️")
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

struct Sunny_Previews: PreviewProvider {
    static var previews: some View {
        Sunny()
    }
}
