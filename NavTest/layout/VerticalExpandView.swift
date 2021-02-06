//
//  VerticalExpandView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 6/2/21.
//

import SwiftUI

struct ExpandHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

//TODO: This does not work

struct VerticalExpandView: View {
    
    var body: some View {
        HStack {
            Text("View: ")
            
            Text("Very long view to wrap onto 2 lines to test things")
            Text("A tall view")
                .frame(minHeight: 100)
        }
        
        .overlay(GeometryReader { proxy in
            //preference(key: ExpandHeightKey.self, value: proxy.size.height)
            //Text("\(proxy.size.height)")
        })
    }
}

struct VerticalExpandView_Previews: PreviewProvider {
    
    static var previews: some View {
        VerticalExpandView()
    }
}
