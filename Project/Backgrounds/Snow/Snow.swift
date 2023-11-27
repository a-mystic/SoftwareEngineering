//
//  Snow.swift
//  Project
//
//  Created by a mystic on 11/28/23.
//

import SwiftUI
import SpriteKit

struct Snow: View {
    var body: some View {
        GeometryReader { geometry in
            let insideWidth = geometry.size.width
            let insideHeight = geometry.size.height
            ZStack(alignment: .bottom) {
                SpriteView(scene: SnowFall(), options: [.allowsTransparency])
                    .padding(.horizontal)
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(.white)
                    .scaleEffect(1)
                    .frame(width: insideWidth , height: 100)
                elements(width: insideWidth, height: insideHeight)
            }
        }
    }
    
    @ViewBuilder
    func elements(width: CGFloat, height: CGFloat) -> some View {
        Text("☃️")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: -width / 3, y: height / 3)
        Text("🎄")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: width / 3, y: height / 3)
        Text("🌨️")
            .scaleEffect(3)
            .frame(width: width, height: height)
            .offset(x: -width / 3, y: -height / 3)
        Text("☁️")
            .scaleEffect(3)
            .frame(width: width, height: height)
            .offset(x: width / 4, y: -height / 3)
        Text("☁️")
            .scaleEffect(3)     // replace magic number to relative number
            .frame(width: width, height: height)
            .offset(x: width / 7, y: -height / 3)
    }
}


class SnowFall: SKScene {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "snow.sks")!
        addChild(node)
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}

struct Snow_Previews: PreviewProvider {
    static var previews: some View {
        Snow()
    }
}

