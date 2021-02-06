//
//  TextAnimationView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 6/2/21.
//

import SwiftUI

struct AnimatableCustomFontModifier: AnimatableModifier {
    var name: String
    var size: CGFloat

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

extension View {
    
    func animatableFont(name: String, size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
}


struct TextAnimationView: View {
    
    private var fontSize: CGFloat {
        return expanded ? 40 : 20
    }
    
    
    @State var expanded: Bool = true
    @State var scrollOffset: CGFloat = 0

    
    var body: some View {
        ScrollViewOffset { offset in
            self.scrollOffset = offset
        } content: {
            VStack {
                Text("Some long text that might wrap \(scrollOffset)")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .animatableFont(name: "Georgia", size: fontSize)
                    .offset(x: 0, y: self.scrollOffset)
                Toggle(isOn: $expanded.animation(.easeIn), label: {
                    Text("Expand")
                })
                ForEach(0..<6) { i in
                    Text("Some more text to make the page scroll \(i)")
                        .padding(40)
                }
                
            }
        }
        
    }
}

struct TextAnimationView_Preview: PreviewProvider {
 
    static var previews: some View {
        TextAnimationView()
    }
}
