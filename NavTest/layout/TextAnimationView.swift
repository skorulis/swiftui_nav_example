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

struct TopNavBar: View {
    
    private var fontSize: CGFloat {
        return expanded ? 40 : 20
    }
    
    var expanded: Bool
    
    init(expanded: Bool) {
        self.expanded = expanded
    }
    
    var body: some View {
        ZStack {
            Text("Some long text that might wrap")
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .animatableFont(name: "Georgia", size: fontSize)
                .animation(.easeIn)
                //.offset(x: 0, y: self.scrollOffset)
        }
    }
}


struct TextAnimationView: View {
    
    private var fontSize: CGFloat {
        return expanded ? 40 : 20
    }
    
    @State var expanded: Bool = true
    @State var scrollOffset: CGFloat = 0 {
        didSet {
            if expanded {
                if scrollOffset > 50 {
                    expanded = false
                }
            } else  {
                if scrollOffset < 20 {
                    expanded =  true
                }
            }
        }
    }

    
    var body: some View {
        ScrollViewOffset { offset in
            self.scrollOffset = offset
        } content: {
            VStack {
                Text("Some long text that might wrap")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .animatableFont(name: "Georgia", size: fontSize)
                    .animation(.easeIn)
                    .offset(x: 0, y: self.scrollOffset)
                
                Toggle(isOn: $expanded.animation(.easeIn), label: {
                    Text("Expand")
                })
                
                Text("Offset \(scrollOffset)")
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
